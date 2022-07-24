# https://docs.docker.com/engine/reference/builder/
FROM node:18-alpine

ENV APP_WORKDIR=/myhome
ENV NODE_ENV=development
# ENV APP_USER=myuser

# RUN adduser -D -h $APP_WORKDIR -s /sbin/nologin $APP_USER
# USER $APP_USER

WORKDIR $APP_WORKDIR

COPY . .

RUN yarn install --production

EXPOSE 3000

CMD npm run start
