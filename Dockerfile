FROM rust:1.67
MAINTAINER boykush <k.taichi0315@gmail.com>

RUN apt-get update && apt-get install -y git

RUN cargo install scraps

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
