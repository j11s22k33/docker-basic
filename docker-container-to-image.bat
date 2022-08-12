:: docker-run.bat
:: docker-commit.bat
:: commit 하면 컨테이너를 이미지로 저장한다.

:: "https://docs.docker.com/engine/reference/commandline/run/"
set CONTAINER=cms-adm
set FROM_IMAGE=ubuntu:latest
set COMMIT_IMAGE=j11s2233/%CONTAINER%

:: 컨테이너 강제 삭제
docker rm %CONTAINER% --force

docker run -d --privileged -u root -it ^
	-p 22:22 ^
	--name %CONTAINER% %FROM_IMAGE%

:: 패키지 설치
docker exec --privileged -u root -it %CONTAINER% ^
	/bin/bash -c "apt update&& apt install -y ssh net-tools iptables curl wget ufw vim systemctl nmap git sudo zip"

:: 여기까지 진행된 부분을 이미지 생성	
docker commit %CONTAINER% %COMMIT_IMAGE%

:: 컨테이너 강제 삭제
docker rm %CONTAINER% --force