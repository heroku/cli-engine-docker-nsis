FROM ubuntu:16.04

MAINTAINER Jeff Dickey

RUN apt-get -y update && apt-get install -y --no-install-recommends \
  curl \
  git \
  ca-certificates \
  ssh \
  osslsigncode \
  apt-transport-https \
  nsis \
  p7zip-full \
  xz-utils \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install -y --no-install-recommends \
  nodejs \
  yarn \
  && rm -rf /var/lib/apt/lists/*

CMD bash
