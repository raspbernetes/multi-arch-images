# Introduce stage0 to git clone the hubble-ui repository
FROM alpine:3.12 as stage0
RUN apk add git

ARG VERSION

WORKDIR /src/github.com/cilium/hubble-ui
RUN git clone --depth=1 -b ${VERSION} https://github.com/cilium/hubble-ui .

# The upstream Dockerfile begins here; https://github.com/cilium/hubble-ui/blob/master/backend/Dockerfile
FROM docker.io/library/golang:1.15.5-alpine3.12 as stage1
RUN apk add bash
WORKDIR /app

# make absolute path references to files from strage0
COPY --from=stage0 /src/github.com/cilium/hubble-ui/backend .
RUN bash ctl.sh build

FROM docker.io/library/alpine:3.12
COPY --from=stage1 /app/backend /usr/bin

CMD ["/usr/bin/backend"]