FROM alpine:3.10

ARG KUBECTL_VERSION=v1.15.9
ARG VERSION=1.18.0

WORKDIR /home/flux

RUN apk add --no-cache openssh-client curl ca-certificates tini git gnutls gnupg gawk socat && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing git-secret

RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf
COPY ./kubeconfig /root/.kube/config

COPY ./known_hosts.sh /home/flux/known_hosts.sh
RUN chmod +x /home/flux/known_hosts.sh && \
    sh /home/flux/known_hosts.sh /etc/ssh/ssh_known_hosts && \
    rm /home/flux/known_hosts.sh

# Add default SSH config, which points at the private key we'll mount
COPY ./ssh_config /etc/ssh/ssh_config

# hadolint ignore=SC2086
RUN ARCH="$(apk --print-arch)"; \
    case "$ARCH" in \
    armv7) export GOARCH='arm' GOARM=7 ;; \
    aarch64) export GOARCH='arm64' ;; \
    x86_64) export GOARCH='amd64' ;; \
    esac; \
    echo "----------------------------------" \
    && echo "apk arch: $(apk --print-arch)" \
    && echo "parsed arch: ${GOARCH}" \
    && echo "----------------------------------" \
    && curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${GOARCH}/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && curl -L -o /usr/local/bin/fluxctl https://github.com/fluxcd/flux/releases/download/${VERSION}/fluxctl_linux_${GOARCH} \
    && chmod +x /usr/local/bin/fluxctl

COPY --from=xunholy/fluxd:latest /usr/local/bin/fluxd /usr/local/bin/fluxd
RUN chmod +x /usr/local/bin/fluxd

COPY --from=xunholy/kustomize:latest /usr/local/bin/kustomize /usr/local/bin/kustomize
RUN chmod +x /usr/local/bin/kustomize

COPY --from=xunholy/sops:latest /usr/local/bin/sops /usr/local/bin/sops
RUN chmod +x /usr/local/bin/sops

COPY --from=quay.io/squaremo/kubeyaml:0.7.0 /usr/lib/kubeyaml /usr/lib/kubeyaml/
ENV PATH=/bin:/usr/bin:/usr/local/bin:/usr/lib/kubeyaml

ENTRYPOINT ["/sbin/tini", "--", "fluxd"]
