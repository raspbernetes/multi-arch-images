# Introduce stage0 to git clone the hubble-ui repository
FROM alpine:3.12 as stage0
RUN apk add git

ARG VERSION

WORKDIR /src/github.com/cilium/hubble-ui
RUN git clone --depth=1 -b ${VERSION} https://github.com/cilium/hubble-ui .

# The upstream Dockerfile begins here; https://github.com/cilium/hubble-ui/blob/master/Dockerfile
# node:14.5.0-alpine is used as node:14.4.0-alpine does not contain an arm/v7 manifest
FROM node:14.15.4-alpine as stage1
# for arm64 images, we require build-base and python to compile some npm modules
RUN apk add bash python build-base

WORKDIR /app

# make absolute path references to files from strage0
COPY --from=stage0 /src/github.com/cilium/hubble-ui/package.json package.json
COPY --from=stage0 /src/github.com/cilium/hubble-ui/package-lock.json package-lock.json
COPY --from=stage0 /src/github.com/cilium/hubble-ui/scripts/ scripts/

RUN npm set unsafe-perm true
RUN npm install
RUN npm set unsafe-perm false

COPY --from=stage0 /src/github.com/cilium/hubble-ui .

ARG NODE_ENV=production
RUN npm run build

# use the unprivileged nginx container configured for non-root execution (upstream is bitnami)
FROM nginxinc/nginx-unprivileged
COPY --from=stage1 /app/server/public /app
# this is bit of a hack as the nginginc image uses port 8080 in their default config
COPY --from=stage1 /app/server/nginx-hubble-ui-frontend.conf /etc/nginx/conf.d/default.conf