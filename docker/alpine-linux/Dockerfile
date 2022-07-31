FROM node:18-alpine

ENV USER_NAME=ubuntu
ENV HOME_DIR=/home/$USER_NAME
ENV APP_NAME=tv-cms-adm

RUN adduser -D -h $HOME_DIR $USER_NAME
RUN chmod u+s /bin/busybox

USER $USER_NAME

WORKDIR $HOME_DIR/$APP_NAME

COPY --chown=$USER_NAME . .

RUN rm -rf yarn.lock
RUN rm -rf package-lock.json

RUN yarn install --production

ENV NODE_ENV=development
ENTRYPOINT npm run start_dev

EXPOSE 22
EXPOSE 3000