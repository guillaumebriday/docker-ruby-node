FROM ruby:2.5.3-slim
LABEL maintainer "Guillaume Briday <guillaumebriday@gmail.com>"

RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    curl \
    gnupg2

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
