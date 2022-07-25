# https://docs.docker.com/engine/reference/builder/
FROM node:18-alpine

ENV USER_HOME=/myhome
ENV APP_ROOT=/myapp
ENV APP_USER=myuser
ENV PORT=3000
ENV NODE_ENV=development

WORKDIR $APP_ROOT

COPY . .
RUN rm -rf yarn.lock
RUN rm -rf package-lock.json

# RUN adduser -D -h $USER_HOME -s /sbin/nologin $APP_USER
RUN adduser -D -h $USER_HOME -s /bin/sh $APP_USER
RUN chown -R $APP_USER:$APP_USER .
USER $APP_USER

RUN yarn install --production
CMD npm run start_dev

EXPOSE $PORT