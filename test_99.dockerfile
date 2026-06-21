# Benchmark test 99
FROM alpine:3.18
RUN apk add --no-cache \
    build-base \
    cmake \
    git \
    subversion \
    mercurial \
    autoconf \
    automake \
    libtool \
    pkgconfig \
    linux-headers
RUN adduser -D builder
USER builder
WORKDIR /home/builder
CMD ["/bin/sh"]
