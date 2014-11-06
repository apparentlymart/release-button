
PI_USERNAME:=pi
PI_HOSTNAME:=172.16.0.9

releasebutton: releasebutton.go
	GOARCH=arm GOARM=5 go build releasebutton.go

upload: releasebutton
	scp releasebutton $(PI_USERNAME)@$(PI_HOSTNAME):
