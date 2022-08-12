set CONTAINER=myubuntu2
set RUN_IMAGE=j11s2233/%CONTAINER%

docker rm %CONTAINER% --force

docker run ^
	--detach ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
	--publish 22:22 ^
	--publish 80:80 ^
	--name %CONTAINER% ^
	%RUN_IMAGE%

:: [root] authorized_keys pub키 셋팅
docker exec ^
	--privileged ^
	--user root ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
	/bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys&& echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAx7Im+nTpceDvGUAMSFNhBMWgaTWuKjOJwtslAOJdDmP9i/WdFckDOaYmB9Qci59tfte0dp9lz3D5MJWTrOGVdB5GKgXTNwQ4KxTS4C4UNPP40EaYy0eqF0MuGPx8DvyB6ftvTsWNcv5ZYQ5pWU8mPY40Qonscj2DWOs4VWJvpxJBBMPMdIZKB/GJ1b17Kt0AJdvDoRAJ0pdiqq0v4q0VjP4FBPhKlL/Z6NxVF4C123wKDihFeFjdOufOC5yekzrDtmOuIidRRVFUgIyWLVGrq565zg0B1ZzZkoxP+n2DrGN5HhXkB405EGrnTbcK5PufZgU5D65WgJJU4GYgbxrdzw==' >> ~/.ssh/authorized_keys"

:: [ubuntu] authorized_keys pub키 셋팅
:: TvAppCmsDevelopment.pub
docker exec ^
	--privileged ^
	--user ubuntu ^
	--interactive ^
	--tty ^
    %CONTAINER% ^
    /bin/bash -c "mkdir ~/.ssh&& chmod 700 ~/.ssh&& touch ~/.ssh/authorized_keys&& chmod 600 ~/.ssh/authorized_keys&& echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDfImfKrT5iqRsgtOKCPGX6a48es0JTC2Sfl0wZAioQLzop/CwBHw/mI05Fv33AdoTK+X6fqQjnER77UxJ0PY/DJA/I/ocoBBCLH1nVXPsMztLygPKPsLeH/vhVrab+998aVUKss7ck+r1sTZig67lcPsQ4rK1/gY5IwklgSARq+C/SZ2s4KVpd59ewCdsa9vK2mqRAj1prJehG3qfXeZqA/MCb1e/wouOhHyi6aEC2d3rLbiX6rNu50m27HpNiMlyXD6iA9qIZvPuls9gblBt4G3dMSgzStxGOT5WqhEacwN284EVfNxaHkyb5YLo25+Nqf8js9KU8BTE1vgSd+bzt' >> ~/.ssh/authorized_keys"
	
:: [root] ssh 시작
docker exec ^
    --privileged ^
    --user root ^
    --interactive ^
    --tty ^
    %CONTAINER% ^
	/bin/bash -c "service ssh start"