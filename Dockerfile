# setting base image
FROM debian:jessie

MAINTAINER kotetuco

# add user
RUN useradd --user-group --create-home --shell /bin/false rust

USER root
RUN set -x && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl

ENV HOME=/home/rust
USER rust
WORKDIR /home/rust

# install rustup
RUN set -x && \
    curl https://sh.rustup.rs -o ~/rustup-init.sh -sSf && \
    sh ~/rustup-init.sh -y && \
    ls -la

RUN chown -R rust:rust $HOME/*

RUN set -x && \
    . ~/.cargo/env && \
    rustup target add i686-unknown-linux-gnu && \
    rustup install nightly && \
    rustc --version && \
    rustup run nightly rustc --version

RUN set -x && \
    . ~/.cargo/env && \
    rustup show
