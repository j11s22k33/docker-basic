# https://docs.docker.com/engine/reference/builder/
FROM node:18-alpine

ENV HOME=/myhome
ENV NODE_ENV=development
ENV PORT=3000
# ENV USER=myuser

# RUN adduser -D -h $HOME -s /sbin/nologin $USER
# USER $USER

WORKDIR $HOME

COPY . .

RUN yarn install --production

EXPOSE $PORT

CMD npm run start
