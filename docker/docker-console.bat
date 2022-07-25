:: "https://docs.docker.com/engine/reference/commandline/attach"

set CONTAINER=mycontainer
set CMD=/bin/sh

docker attach %CONTAINER%

exit /B

docker exec ^
	--privileged ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    %CMD%