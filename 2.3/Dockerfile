FROM ruby:2.3@sha256:78cc821d95c48621e577b6b0d44c9d509f0f2a4e089b9fd0ca2ae86f274773a8
LABEL maintainer "Guillaume Briday <guillaumebriday@gmail.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
