# Docker Rust BareMetal dev

## A Docker container for BareMetal developing in Rust.

The container can be build Rust source code.

## How to use this image?

### Installation

1. Install Docker.
1. Cloning this repository.
1. Make `shared` directory in root of this repository.
1. Run `docker-compose build` and `docker-compose create` command. So you can make image and container.

### Running and attach the container

1. Run `docker-compose up -d` command.
1. If you want to attach the container, please run `docker exec -it rust-baremetal bash --login` command.

### Stop the container

1. Run `docker-compose stop` command.
