:: "https://docs.docker.com/engine/reference/commandline/build/"

set DOCKER_FILE=./Dockerfile.j11s22k33-ubuntu
set IMAGE=j11s22k33/ubuntu
set TAG=latest
set BUILD_BASE_DIR=../

docker build ^
    --file %DOCKER_FILE% ^
    --tag %IMAGE%:%TAG% ^
    %BUILD_BASE_DIR%