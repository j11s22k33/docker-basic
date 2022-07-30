:: "https://docs.docker.com/engine/reference/commandline/exec/"

set CONTAINER=cms-adm
set CMD=/bin/bash -c "echo 111"

docker exec ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    %CMD%
