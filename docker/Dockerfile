# https://docs.docker.com/engine/reference/builder/
# FROM - {docker build} - base 이미지
FROM node:16

# ENV USER=myuser
ENV HOME=/myhome
ENV NODE_ENV=development
ENV PORT=80

# RUN adduser -D -h $HOME -s /sbin/nologin $USER

WORKDIR $HOME

COPY . .

RUN yarn install --production

EXPOSE $PORT/tcp

# CMD - {docker run} - 이미지 실행 시 디폴트 커맨드 또는 파라미터 설정
CMD npm run start
# USER $USER