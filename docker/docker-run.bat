set CONTAINER=myubuntu
set IMAGE=ubuntu
set TAG=latest

docker rm ^
	%CONTAINER% ^
	--force

::cmd /K

docker run ^
	--detach ^
	--privileged ^
	--interactive ^
	--tty ^
    --publish 3000:3000 ^
	--name %CONTAINER% ^
	%IMAGE%:%TAG%
	
::cmd /K

docker exec ^
	--privileged ^
	--interactive ^
	--tty ^
	%CONTAINER% ^
	/bin/sh -c "apt update&& apt install -y git&& git clone https://github.com/j11s22k33/json-server-basic.git&& apt install -y curl&& curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | sh"
	
::cmd /K

:: 여기서 에러 많이 발생
docker exec ^
	--privileged ^
	--interactive ^
	--tty ^
	%CONTAINER% ^
	/bin/sh -c ". ~/.nvm/nvm.sh&&nvm install --lts&&cd json-server-basic&&npm install&&npm run start"