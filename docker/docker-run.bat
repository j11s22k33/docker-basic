:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=myubuntu
set IMAGE=ubuntu
set TAG=latest

docker rm %CONTAINER% --force

docker run ^
	--detach ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
	--publish 8080:8080 ^
	--publish 5000:5000 ^
    --publish 3000:3000 ^
    --publish 443:443 ^
    --publish 80:80 ^
	--name %CONTAINER% ^
	%IMAGE%:%TAG%

::exit /B

::
:: /bin/bash -c "service ssh start&& /bin/bash" 없으면 컨테이너 바로 죽음
:: 		&& /bin/bash 없으면 컨테이너 바로 죽는다

echo "::::::::::::::::::: apt update & install package :::::::::::::::::::"
docker exec --privileged -u root -it %CONTAINER% /bin/bash -c "apt update&& apt install -y curl&& apt install -y git"

::exit /B

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: "npm: not found -> nvm 로드 후 npm 사용하면 된다 -> . ~/.nvm/nvm.sh && npm install express"
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo "::::::::::::::::::: install nvm(node+npm) :::::::::::::::::::"
docker exec --privileged -u root -it %CONTAINER% /bin/bash -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash&& . ~/.nvm/nvm.sh&& nvm install --lts"

::exit /B

echo "::::::::::::::::::: install json-server-basic :::::::::::::::::::"
docker exec --privileged -u root -it %CONTAINER% /bin/bash -c "git clone https://github.com/j11s22k33/json-server-basic.git&& cd json-server-basic&& . ~/.nvm/nvm.sh&& npm install"

::exit /B

echo "::::::::::::::::::: start json-server-basic :::::::::::::::::::"
docker exec --privileged -u root -d %CONTAINER% /bin/bash -c "cd json-server-basic&& . ~/.nvm/nvm.sh&& npm run start"