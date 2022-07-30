:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=cms-admin
set IMAGE=ubuntu:latest
set COMMIT_REPO=j11s22k33/cms-admin:latest

docker rm %CONTAINER% --force

docker run -d --privileged -u root -it ^
    -p 3000:3000 ^
	-p 80:80 ^
	-p 22:22 ^
	--name %CONTAINER% %IMAGE%