REM docker-hub 에서 push
set IMAGE=j11s22k33/myimage
set TAG=latest

docker push ^
    %IMAGE%:%TAG%
