FROM ubuntu:18.04

LABEL maintainer="Shinya Suzuki<sshinya@bio.titech.ac.jp>"
LABEL description="Container for rsync"

RUN apt-get update && \
    apt-get install -y --no-install-recommends rsync && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["rsync"]
CMD ["--help"]
