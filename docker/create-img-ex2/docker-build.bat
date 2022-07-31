set FROM_IMAGE=ubuntu:latest
set CONTAINER=myubuntu2
set COMMIT_IMAGE=j11s2233/%CONTAINER%

:: 컨테이너 강제 삭제
docker rm %CONTAINER% --force

docker run -d --privileged -u root -it ^
	-p 22:22 ^
	--name %CONTAINER% %FROM_IMAGE%

:: 패키지 설치
docker exec --privileged -u root -it %CONTAINER% ^
	/bin/bash -c "apt update&& apt install -y ssh net-tools iptables curl wget ufw vim systemctl nmap git sudo zip"

:: [root] ubuntu 계정생성
docker exec --privileged -u root -it %CONTAINER% ^
	/bin/bash -c "adduser --home /home/ubuntu ubuntu"

:: [root] ubuntu sudo 설정
docker exec --privileged -u root -it %CONTAINER% ^
    /bin/bash -c "echo 'ubuntu ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers.d/sudousers"

:: 여기까지 진행된 부분을 이미지 생성	
docker commit %CONTAINER% %COMMIT_IMAGE%

:: 컨테이너 강제 삭제
docker rm %CONTAINER% --force