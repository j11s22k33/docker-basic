set CONTAINER=myubuntu

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
    /bin/bash -c "cd ~&& /bin/bash"