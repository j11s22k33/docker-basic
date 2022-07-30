# https://docs.docker.com/engine/reference/builder/
FROM node:18-alpine

ENV USER_NAME=ubuntu
ENV HOME_DIR=/home/myhome
ENV APP_NAME=my-app
ENV NODE_ENV=development

# RUN adduser -D -h $USER_HOME -s /sbin/nologin $APP_USER
RUN adduser -D -h $HOME_DIR -s /bin/sh $USER_NAME

USER $USER_NAME

WORKDIR $HOME_DIR/$APP_NAME

COPY --chown=$USER_NAME . .

RUN rm -rf yarn.lock
RUN rm -rf package-lock.json

RUN yarn install --production

ENTRYPOINT npm run start_dev

EXPOSE 22
EXPOSE 3000

# CMD npm run start_dev
# ENTRYPOINT /bin/bash -c "service ssh start && /bin/bash"
# 		&& /bin/bash 로 entrypoint 유지
# entrypoint가 죽으면 컨테이너도 죽는다