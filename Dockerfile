FROM ghcr.io/boykush/scraps:v0.28.0

RUN apt-get update && apt-get install -y git

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
