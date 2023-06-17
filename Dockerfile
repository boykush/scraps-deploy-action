FROM ghcr.io/boykush/scraps-image:latest

RUN apt-get update && apt-get install -y git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
