:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=myubuntu
set IMAGE=j11s22k33/myubuntu
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

echo "::::::::::::::::::: install json-server-basic :::::::::::::::::::"
docker exec --privileged -u root -it %CONTAINER% /bin/bash -c "git clone https://github.com/j11s22k33/json-server-basic.git&& cd json-server-basic&& . ~/.nvm/nvm.sh&& npm install"

::exit /B

echo "::::::::::::::::::: start json-server-basic :::::::::::::::::::"
docker exec --privileged -u root -d %CONTAINER% /bin/bash -c "cd json-server-basic&& . ~/.nvm/nvm.sh&& npm run start"