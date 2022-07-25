:: "https://docs.docker.com/engine/reference/commandline/pull/"
:: "docker-hub에서 pull"

set IMAGE=j11s22k33/myimage
set TAG=latest

docker pull ^
    %IMAGE%:%TAG%
