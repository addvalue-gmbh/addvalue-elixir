FROM ubuntu:16.04

LABEL maintainer="addvalue"
LABEL email="info@addvalue.de"
LABEL website="addvalue.de"
LABEL project_link="https://github.com/addvalue-gmbh/addvalue-elixir"
LABEL version="0.1.0"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y wget curl locales build-essential libpq-dev git inotify-tools apt-utils postgresql-client
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update -qq && apt-get install esl-erlang -y
RUN apt-get install elixir -y

ENV DEBIAN_FRONTEND noninteractive

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mix local.hex --force && mix local.rebar --force
