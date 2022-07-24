# docker

https://docs.docker.com/engine/reference/run/
https://docs.docker.com/engine/reference/commandline/exec/

### docker run & docker build

```
--cap-add=ALL 모든 권한 또는 -cap-add=NET_ADMIN 일부 권한
--privileged 모든 권한
--interactive --tty 대화형 터미널창 활성화
--detach 분리모드
--rm 컨테이너 중지시 컨테이너 자동 제거
--workdir="/root"
--env "NODE_ENV=development"
--expose 3000
--publish 3000:3000
```