set CONTAINER=myubuntu

docker exec ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    /bin/bash

exit /B

:: "https://docs.docker.com/engine/reference/commandline/attach"
:: "컨테이너에 직접 붙임. Ctrl+] 로 detach. exit 하면 컨테이너도 종료됨."
docker attach --detach-keys="ctrl-]" %CONTAINER%