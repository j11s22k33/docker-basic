:: "https://docs.docker.com/engine/reference/commandline/exec/"

set CONTAINER=mycontainer
set CMD=/bin/sh

docker exec ^
	--privileged ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    %CMD%
