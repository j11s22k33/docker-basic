set CONTAINER=tv-cms-adm
set IMAGE=j11s22k33/tv-cms-adm

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