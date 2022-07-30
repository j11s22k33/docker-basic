set CONTAINER=cms-server-container
set IMAGE=j11s22k33/cms-server

docker rm  %CONTAINER% --force

docker run ^
	--detach ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    --publish 3000:3000 ^
	--name %CONTAINER% ^
	%IMAGE%