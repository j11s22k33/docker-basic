:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=j11s22k33-ubuntu
set IMAGE=j11s22k33/ubuntu
set TAG=latest

docker rm %CONTAINER% --force

docker run ^
	--detach ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    --publish 22:22 ^
	--name %CONTAINER% ^
	%IMAGE%:%TAG%