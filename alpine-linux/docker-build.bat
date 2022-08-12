set DOCKER_FILE=./Dockerfile
set IMAGE=j11s22k33/tv-cms-adm
set BUILD_BASE_DIR=../

docker build ^
    --file %DOCKER_FILE% ^
    --tag %IMAGE% ^
    %BUILD_BASE_DIR%