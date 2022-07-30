:: "https://docs.docker.com/engine/reference/commandline/run/"

set CONTAINER=cms-adm
set IMAGE=j11s2233/cms-adm
set TAG=latest

docker rm %CONTAINER% --force

docker run -d --privileged -u root -it ^
    -p 3000:3000 ^
	-p 80:80 ^
	-p 22:22 ^
	--name %CONTAINER% %IMAGE%:%TAG%