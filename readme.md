# Docker Rust BareMetal dev

## A Docker container for BareMetal developing in Rust.

The container can be build Rust source code.

## How to use this image?

1. Install Docker.
1. Cloning this repository.
1. Make `shared` directory in root of this repository.
1. Run `docker-compose build` and `docker-compose run rust-baremetal` command.
1. After you attached the container, please run `suorce ~/.cargo/env` command.
