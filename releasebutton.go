
package main

import (
	"syscall"
	"os"
	"fmt"
	"time"
//	"path/filepath"
//	"strings"
//	"io/ioutil"
)



func buttons(epollFD int, releaseValueFile *os.File) {
	releaseFd := int(releaseValueFile.Fd())

	if err := syscall.SetNonblock(releaseFd, true); err != nil {
		fmt.Println("Couldn't set nonblock")
		return
	}

	var event syscall.EpollEvent

	event.Fd = int32(releaseFd)
	event.Events = syscall.EPOLLIN | (syscall.EPOLLET & 0xffffffff) | syscall.EPOLLPRI

	if err := syscall.EpollCtl(epollFD, syscall.EPOLL_CTL_ADD, releaseFd, &event); err != nil {
		fmt.Println("Cannot EpollCtl")
		return
	}

	var epollEvents [1]syscall.EpollEvent
	readBuf := []byte{0};

	for {
		numEvents, err := syscall.EpollWait(epollFD, epollEvents[:], -1)
		if err != nil {
			fmt.Println("epoll wait failed")
		}
		for i := 0; i < numEvents; i++ {
			//fmt.Println("event")
		}
		releaseValueFile.ReadAt(readBuf, 0)
		if (readBuf[0] == '1') {
			fmt.Println("unpress")
		} else if (readBuf[0] == '0') {
			fmt.Println("press")
		} else {
			fmt.Println("huh?")
		}
	}
}

func lights(statusValueFile *os.File) {
	for {
		time.Sleep(time.Second)
		statusValueFile.Write([]byte{'0'})
		time.Sleep(time.Second)
		statusValueFile.Write([]byte{'1'})
	}
}

func main() {

	epollFD, err := syscall.EpollCreate1(0)
	if err != nil {
		fmt.Println("No epoll")
		return
	}

	releaseValueFile, err := os.OpenFile("/sys/class/gpio/gpio25/value", os.O_RDWR, 0600)
	if err != nil {
		fmt.Println("No release button GPIO pin")
		return
	}

	statusValueFile, err := os.OpenFile("/sys/class/gpio/gpio24/value", os.O_RDWR, 0600)
	if err != nil {
		fmt.Println("No status LED GPIO pin")
	}

	go buttons(epollFD, releaseValueFile)
	go lights(statusValueFile)

	c := make(chan int32)
	<-c
}
