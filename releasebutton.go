
package main

import (
	"syscall"
	"os"
	"fmt"
	"time"
	"net/http"
	"io/ioutil"
	"bytes"
)

type Project struct {
	name string
	statusUrl string
	stable bool
	building bool
}

var projects []Project = []Project{
	Project{
		name: "Phoenix",
		statusUrl: "http://maria.saymedia.com/job/phoenix/job/master/api/json?tree=color",
		stable: true,
		building: false,
	},
	Project{
		name: "CMS",
		statusUrl: "http://maria.saymedia.com/job/tempest/job/master/api/json?tree=color",
		stable: true,
		building: false,
	},
	Project{
		name: "ContentSvc",
		statusUrl: "http://maria.saymedia.com/job/contentsvc/job/master/api/json?tree=color",
		stable: true,
		building: false,
	},
	Project{
		name: "Kraken",
		statusUrl: "http://maria.saymedia.com/job/kraken/job/master/api/json?tree=color",
		stable: true,
		building: false,
	},
}

var currentProject *Project = &projects[0]

func buttons(releaseValueFile *os.File) {
	epollFD, err := syscall.EpollCreate1(0)
	if err != nil {
		fmt.Println("No epoll")
		return
	}

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
		if currentProject.building {
			statusValueFile.Write([]byte{'0'})
		} else {
			if currentProject.stable {
				statusValueFile.Write([]byte{'1'})
			} else {
				statusValueFile.Write([]byte{'0'})
			}
		}
		time.Sleep(time.Second)
		if currentProject.stable {
			statusValueFile.Write([]byte{'1'})
		} else {
			statusValueFile.Write([]byte{'0'})
		}
	}
}

func pollStatus(projects []Project) {
	blue_bytes := []byte{'b', 'l', 'u', 'e'}
	anime_bytes := []byte{'a', 'n', 'i', 'm', 'e'}

	for {
		for _, project := range projects {
			resp, err := http.Get(project.statusUrl)
			if err != nil {
				fmt.Println("Failed to get build status for %s", project.name)
				continue
			}

			body, err := ioutil.ReadAll(resp.Body)
			if err != nil {
				fmt.Println("Failed to read body for %s", project.name)
				continue
			}

			project.stable = bytes.Contains(body[:], blue_bytes)
			project.building = bytes.Contains(body[:], anime_bytes)

			resp.Body.Close()
			time.Sleep(10 * time.Second)
		}
	}
}

func menu(counterClockValueFile *os.File) {
	epollFD, err := syscall.EpollCreate1(0)
	if err != nil {
		fmt.Println("No epoll")
		return
	}

	counterClockFd := int(counterClockValueFile.Fd())

	if err := syscall.SetNonblock(counterClockFd, true); err != nil {
		fmt.Println("Couldn't set nonblock")
		return
	}

	var event syscall.EpollEvent

	event.Fd = int32(counterClockFd)
	event.Events = syscall.EPOLLIN | (syscall.EPOLLET & 0xffffffff) | syscall.EPOLLPRI

	if err := syscall.EpollCtl(epollFD, syscall.EPOLL_CTL_ADD, counterClockFd, &event); err != nil {
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
		counterClockValueFile.ReadAt(readBuf, 0)
		if (readBuf[0] == '1') {
			fmt.Println("turn")
		} else if (readBuf[0] == '0') {
			fmt.Println("unturn")
		} else {
			fmt.Println("huh?")
		}
	}
}

func main() {

	releaseValueFile, err := os.OpenFile("/sys/class/gpio/gpio25/value", os.O_RDWR, 0600)
	if err != nil {
		fmt.Println("No release button GPIO pin")
		return
	}

	rotaryCounterClockValueFile, err := os.OpenFile("/sys/class/gpio/gpio18/value", os.O_RDWR, 0600)
	if err != nil {
		fmt.Println("No counter-clockwise rotary GPIO pin")
		return
	}

	statusValueFile, err := os.OpenFile("/sys/class/gpio/gpio24/value", os.O_RDWR, 0600)
	if err != nil {
		fmt.Println("No status LED GPIO pin")
		return
	}

	go buttons(releaseValueFile)
	go lights(statusValueFile)
	go pollStatus(projects)
	go menu(rotaryCounterClockValueFile)

	c := make(chan int32)
	<-c
}
