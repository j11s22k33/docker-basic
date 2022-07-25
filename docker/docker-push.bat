:: "https://docs.docker.com/engine/reference/commandline/push/"
:: "docker-hub에 push"

set IMAGE=j11s22k33/myimage
set TAG=latest

docker push ^
    %IMAGE%:%TAG%
