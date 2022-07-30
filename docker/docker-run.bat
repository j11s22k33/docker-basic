:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=myubuntu
set IMAGE=j11s22k33/myubuntu

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
	%IMAGE%

exit /B


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

::exit /B

:::::::::::::::::::::::::::::::
:::::::::::::::::::::::::::::::
:: 공개키 추가하기
:: cat id_rsa.pub >> ~/.ssh/authorized_keys	
docker exec ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    /bin/bash -c "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx7Im+nTpceDvGUAMSFNhBMWgaTWuKjOJwtslAOJdDmP9i/WdFckDOaYmB9Qci59tfte0dp9lz3D5MJWTrOGVdB5GKgXTNwQ4KxTS4C4UNPP40EaYy0eqF0MuGPx8DvyB6ftvTsWNcv5ZYQ5pWU8mPY40Qonscj2DWOs4VWJvpxJBBMPMdIZKB/GJ1b17Kt0AJdvDoRAJ0pdiqq0v4q0VjP4FBPhKlL/Z6NxVF4C123wKDihFeFjdOufOC5yekzrDtmOuIidRRVFUgIyWLVGrq565zg0B1ZzZkoxP+n2DrGN5HhXkB405EGrnTbcK5PufZgU5D65WgJJU4GYgbxrdzw==' >> ~/.ssh/authorized_keys"

:: cat samsung-cms-key.pub >> ~/.ssh/authorized_keys		
docker exec ^
	--privileged ^
	--user ubuntu ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    /bin/bash -c "echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCg9/eH0FNByfRBQpNBx8HmdSr47xeHC7FN4bI+guet5e4CFnZ/ByKEJC/aG0vVj2kcUJCvKFfhNuxkWKjSOahKzH2a60nco3b9IT5zSwFwIjogWXVkSF0c6JMsEPVcAw0beRLV0nedDXz2Dns9AkN6fO7kqnKF+aGKwuI9OjkGmXT9kgNufJmB3YhjKGGxMSKNjmDW3tQViBD1Gtn53TzrkVCyeAqlbqC6zHURwhi0B9DxxN3WU+NeGAIm2npZCBEP5Mp60Kbjm600A2vPj210sM//EFZ2V4IXRcKITgv4o8kHr9AvkxUo80qpbOQFf6kmnnzTzlnB4kOx+QITWFL/' >> ~/.ssh/authorized_keys"