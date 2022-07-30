:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=j11s22k33-ubuntu
set IMAGE=j11s22k33/ubuntu
set TAG=latest

docker rm %CONTAINER% --force

docker run ^
	--detach ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    --publish 3000:3000 ^
	--publish 80:80 ^
	--publish 22:22 ^
	--name %CONTAINER% ^
	%IMAGE%:%TAG%

::exit /B

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