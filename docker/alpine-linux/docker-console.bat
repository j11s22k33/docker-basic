set CONTAINER=tv-cms-adm

IF "%1"=="" (	
	set USER=root
) ELSE (
	set USER=%1
)

docker exec ^
	--privileged ^
	--user %USER% ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    /bin/sh -c "cd ~&& /bin/sh"