:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=ubuntu-test
set IMAGE=j11s22k33/ubuntu
set TAG=latest

docker rm %CONTAINER% --force

docker run ^
	--detach ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    --publish 22:22 ^
	--name %CONTAINER% ^
	%IMAGE%:%TAG% ^	

::
:: /bin/bash -c "service ssh start&& /bin/bash" 없으면 컨테이너 바로 죽음
:: 		&& /bin/bash 없으면 컨테이너 바로 죽는다
:: /bin/bash -c "apt update&& apt install -y ssh net-tools iptables curl wget ufw vim systemctl nmap git&& service ssh start && /bin/bash"

exit /B

echo ":::::::::::::::::::"
docker exec --privileged -u root -it %CONTAINER% /bin/bash -c ""