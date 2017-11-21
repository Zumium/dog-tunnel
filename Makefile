all:
	@make release
release:
	make mac
	make linux
	make win
	make pi
mac:
	make client
	make server
linux:
	make client_linux
	make server_linux
pi:
	make client_pi
	make server_pi
win:
	make client_win
	make server_win
debug:
	make client_debug
	make server_debug

client_debug:
	@go build -gcflags "-N -l" -o dtunnel_d github.com/Zumium/dog-tunnel/client
server_debug:
	@go build -gcflags "-N -l" -o dtunnel_s_d github.com/Zumium/dog-tunnel/server


client:
	@go build -ldflags "-s -w" -o bin/dtunnel github.com/Zumium/dog-tunnel/client
client_linux:
	@GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o bin/linux/dtunnel github.com/Zumium/dog-tunnel/client
client_pi:
	@GOOS=linux GOARCH=arm go build -ldflags "-s -w" -o bin/pi/dtunnel github.com/Zumium/dog-tunnel/client
client_win:
	@GOOS=windows GOARCH=amd64 go build -ldflags "-s -w" -o bin/windows/dtunnel.exe github.com/Zumium/dog-tunnel/client


server:
	@go build -ldflags "-s -w" -o bin/dtunnel_s github.com/Zumium/dog-tunnel/server
server_linux:
	@GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o bin/linux/dtunnel_s github.com/Zumium/dog-tunnel/server
server_pi:
	@GOOS=linux GOARCH=arm go build -ldflags "-s -w" -o bin/pi/dtunnel_s github.com/Zumium/dog-tunnel/server
server_win:
	@GOOS=windows GOARCH=amd64 go build -ldflags "-s -w" -o bin/windows/dtunnel_s.exe github.com/Zumium/dog-tunnel/server

clean:
	@rm -rf bin/*
.PHONY: all debug release client_debug server_debug client server clean
