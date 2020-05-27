FROM python:3.8-alpine3.11
ENV PYTHONUNBUFFERED=1
ARG VERSION=0.1.110

WORKDIR /app/
RUN apk add --no-cache -t build-deps \
      alpine-sdk=1.0-r0 \
    && git clone --depth 1 -b ${VERSION} https://github.com/kiwigrid/k8s-sidecar.git /tmp/k8s-sidecar \
    && cp /tmp/k8s-sidecar/sidecar/* /app/ \ 
    && cp /tmp/k8s-sidecar/requirements.txt /app/ \ 
    && pip install --no-cache-dir -r requirements.txt \
    && apk del --purge build-deps \
    && rm -rf /var/cache/apk/* /tmp/k8s-sidecar requirements.txt

WORKDIR /app
#run as non-privileged user 
USER nobody
ENTRYPOINT [ "python", "-u", "/app/sidecar.py" ]
