FROM node:10-buster

RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    icnsutils \
    graphicsmagick \
    xz-utils \
    rpm \
    bsdtar \
    libopenjp2-tools \
    ruby ruby-dev rubygems build-essential && \
    gem install --no-document fpm

WORKDIR /usr/home/

COPY package.json .

RUN npm i

COPY . .

ENV USE_SYSTEM_FPM true

RUN yarn run dist