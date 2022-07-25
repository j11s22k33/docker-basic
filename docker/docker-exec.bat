:: "https://docs.docker.com/engine/reference/commandline/exec/"

set CONTAINER=mycontainer
set CMD=/bin/bash

docker exec ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    %CMD%
