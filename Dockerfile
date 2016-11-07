# setting base image
FROM debian:jessie

MAINTAINER kotetuco

# add user
RUN useradd --user-group --create-home --shell /bin/false rust

# install tools
USER root
RUN set -x && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y wget && \
    apt-get install -y make && \
    apt-get install -y gcc && \
    apt-get install -y nasm && \
    apt-get install -y mtools && \
    apt-get install -y git && \
    apt-get install -y file && \
    apt-get install -y qemu

# install binutils (i686)
RUN set -x && \
    wget http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz -O /root/binutils-2.27.tar.gz && \
    cd /root/ && \
    tar zxvf binutils-2.27.tar.gz && \
    cd binutils-2.27 && \
    ./configure --target=i686-unknown-linux-gnu && \
    make && \
    make install

ENV HOME=/home/rust
USER rust
WORKDIR /home/rust

# install rustup
RUN set -x && \
    curl https://sh.rustup.rs -o ~/rustup-init.sh -sSf && \
    sh ~/rustup-init.sh -y && \
    ls -la

RUN chown -R rust:rust $HOME/*

# install rust(stable, nightly)
RUN set -x && \
    . ~/.cargo/env && \
    rustup --verbose install nightly && \
    rustup --verbose target add i686-unknown-linux-gnu && \
    rustup default nightly

RUN . $HOME/.cargo/env > $HOME/.bashrc

# for shared volumes
RUN mkdir shared
