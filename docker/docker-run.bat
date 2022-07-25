:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=myubuntu
set IMAGE=ubuntu
set TAG=latest

docker rm %CONTAINER% --force

docker run ^
	--detach ^
	--privileged ^
	--interactive ^
	--tty ^
    --publish 3000:3000 ^
	--name %CONTAINER% ^
	%IMAGE%:%TAG%

::exit /B

echo "::::::::::::::::::: apt update :::::::::::::::::::"
docker exec --privileged -it %CONTAINER% /bin/sh -c "apt update&& apt install -y curl&& apt install -y git"

::exit /B

echo "::::::::::::::::::: install nvm(node+npm) :::::::::::::::::::"
:: "이거 설치잘안됨. 직접 콘솔에서 실행해주면 잘됨"
:: ". ~/.nvm/nvm.sh 는 source ~/.nvm/nvm.sh 와 동일하다"
docker exec --privileged -it %CONTAINER% /bin/sh -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash&& . ~/.nvm/nvm.sh && nvm install --lts"

::exit /B

echo "::::::::::::::::::: install json-server-basic :::::::::::::::::::"
docker exec --privileged -it %CONTAINER% /bin/sh -c "git clone https://github.com/j11s22k33/json-server-basic.git&& cd json-server-basic&& npm install&& npm run start"