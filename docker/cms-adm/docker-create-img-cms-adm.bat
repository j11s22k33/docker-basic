:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=cms-adm
set IMAGE=ubuntu
set TAG=latest
set COMMIT_IMAGE=j11s2233/%CONTAINER%:%TAG%

docker rm %CONTAINER% --force

docker run -d --privileged -u root -it ^
    -p 3000:3000 ^
	-p 80:80 ^
	-p 22:22 ^
	--name %CONTAINER% %IMAGE%:%TAG%

::exit /B

:: 기본 패키지 설치
docker exec --privileged -u root -it %CONTAINER% ^
	/bin/bash -c "apt update&& apt install -y ssh net-tools iptables curl wget ufw vim systemctl nmap git sudo zip"
	
:: ssh 시작
docker exec --privileged -u root -it %CONTAINER% ^
	/bin/bash -c "service ssh start"

:: authorized_keys pub키 셋팅
docker exec --privileged -u root -it %CONTAINER% ^
	/bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys&& echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx7Im+nTpceDvGUAMSFNhBMWgaTWuKjOJwtslAOJdDmP9i/WdFckDOaYmB9Qci59tfte0dp9lz3D5MJWTrOGVdB5GKgXTNwQ4KxTS4C4UNPP40EaYy0eqF0MuGPx8DvyB6ftvTsWNcv5ZYQ5pWU8mPY40Qonscj2DWOs4VWJvpxJBBMPMdIZKB/GJ1b17Kt0AJdvDoRAJ0pdiqq0v4q0VjP4FBPhKlL/Z6NxVF4C123wKDihFeFjdOufOC5yekzrDtmOuIidRRVFUgIyWLVGrq565zg0B1ZzZkoxP+n2DrGN5HhXkB405EGrnTbcK5PufZgU5D65WgJJU4GYgbxrdzw==' >> ~/.ssh/authorized_keys"

:: ubuntu 계정생성
docker exec --privileged -u root -it %CONTAINER% ^
	/bin/bash -c "adduser --home /home/ubuntu ubuntu"

:: ubuntu authorized_keys pub키 셋팅
docker exec --privileged -u ubuntu -it %CONTAINER% ^
    /bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys&& echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCg9/eH0FNByfRBQpNBx8HmdSr47xeHC7FN4bI+guet5e4CFnZ/ByKEJC/aG0vVj2kcUJCvKFfhNuxkWKjSOahKzH2a60nco3b9IT5zSwFwIjogWXVkSF0c6JMsEPVcAw0beRLV0nedDXz2Dns9AkN6fO7kqnKF+aGKwuI9OjkGmXT9kgNufJmB3YhjKGGxMSKNjmDW3tQViBD1Gtn53TzrkVCyeAqlbqC6zHURwhi0B9DxxN3WU+NeGAIm2npZCBEP5Mp60Kbjm600A2vPj210sM//EFZ2V4IXRcKITgv4o8kHr9AvkxUo80qpbOQFf6kmnnzTzlnB4kOx+QITWFL/' >> ~/.ssh/authorized_keys"

:: 여기까지 진행된 부분을 이미지 생성	
docker commit %CONTAINER% %COMMIT_IMAGE%	