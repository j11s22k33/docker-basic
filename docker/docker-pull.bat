REM docker-hub 에서 pull
set IMAGE=j11s22k33/myimage
set TAG=latest

docker pull ^
    %IMAGE%:%TAG%
