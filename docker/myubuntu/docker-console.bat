set CONTAINER=j11s22k33-ubuntu

docker exec ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    /bin/bash