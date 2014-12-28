
// This is just a scratch program for decoding pulses from a rotary encoder.
// Eventually logic like this will be incorporated into the main program.

package main

import (
	"syscall"
	"os"
	"fmt"
	"time"
	"log"
)

func main() {

	encoderTransitions := []int{
		0,
		-1,
		1,
		0,
		1,
		0,
		0,
		-1,
		-1,
		0,
		0,
		1,
		0,
		1,
		-1,
		0,
	}

	rotaryAFile, err := os.OpenFile("/sys/class/gpio/gpio20/value", os.O_RDWR, 0600)
	if err != nil {
		fmt.Println("No rotary A GPIO pin")
		return
	}

	rotaryBFile, err := os.OpenFile("/sys/class/gpio/gpio21/value", os.O_RDWR, 0600)
	if err != nil {
		fmt.Println("No rotary B GPIO pin")
		return
	}

	rotaryAFd := int(rotaryAFile.Fd())
	rotaryBFd := int(rotaryBFile.Fd())

	if err := syscall.SetNonblock(rotaryAFd, true); err != nil {
		fmt.Println("Couldn't set nonblock on A")
		return
	}

	if err := syscall.SetNonblock(rotaryBFd, true); err != nil {
		fmt.Println("Couldn't set nonblock on B")
		return
	}

	epollFD, err := syscall.EpollCreate1(0)
	if err != nil {
		fmt.Println("No epoll")
		return
	}

	var eventA syscall.EpollEvent
	eventA.Fd = int32(rotaryAFd)
	eventA.Events = syscall.EPOLLIN | (syscall.EPOLLET & 0xffffffff) | syscall.EPOLLPRI
	var eventB syscall.EpollEvent
	eventB.Fd = int32(rotaryBFd)
	eventB.Events = syscall.EPOLLIN | (syscall.EPOLLET & 0xffffffff) | syscall.EPOLLPRI

	if err := syscall.EpollCtl(epollFD, syscall.EPOLL_CTL_ADD, rotaryAFd, &eventA); err != nil {
		fmt.Println("Cannot EpollCtl A")
		return
	}
	if err := syscall.EpollCtl(epollFD, syscall.EPOLL_CTL_ADD, rotaryBFd, &eventB); err != nil {
		fmt.Println("Cannot EpollCtl B")
		return
	}

	var epollEvents [2]syscall.EpollEvent
	readBuf := []byte{0, 0}

	transition := 0
	value := 0

	for {
		_, err := syscall.EpollWait(epollFD, epollEvents[:], -1)
		if err != nil {
			fmt.Println("epoll wait failed")
			return
		}

		rotaryAFile.ReadAt(readBuf[0:1], 0)
		rotaryBFile.ReadAt(readBuf[1:2], 0)

		time.Sleep(100 * time.Millisecond)

		aBit := 0
		bBit := 0
		if readBuf[0] == '1' {
			aBit = 2
		}
		if readBuf[1] == '1' {
			bBit = 1
		}

		// Shift the last state into bits 2 & 3, and put the new state in 1 & 0, giving us
		// a four-bit transition code.
		transitionCode := ((transition << 2) | aBit | bBit) & 0xf
		transition := encoderTransitions[transitionCode]

		if transition != 0 {
			value = value + transition
			log.Print("\033[2J\033[0;0H", value)
		}
	}
}
