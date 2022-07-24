REM https://docs.docker.com/engine/reference/commandline/exec/

set CONTAINER=mycontainer
set CMD=/bin/sh

docker exec ^
    --interactive ^
    --tty ^
    %CONTAINER% ^
    %CMD%
