FROM --platform=$BUILDPLATFORM alpine:3.10

ARG KUBECTL_VERSION=v1.15.9
ARG VERSION=1.18.0
ARG TARGETPLATFORM
ARG BUILDPLATFORM

WORKDIR /home/flux

RUN apk add --no-cache openssh-client curl ca-certificates tini git gnutls gnupg gawk socat && \
    apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing git-secret

RUN [ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf
COPY ./kubeconfig /root/.kube/config

COPY ./known_hosts.sh /home/flux/known_hosts.sh
RUN chmod +x /home/flux/known_hosts.sh && \
    sh /home/flux/known_hosts.sh /etc/ssh/ssh_known_hosts && \
    rm /home/flux/known_hosts.sh

COPY ./ssh_config /etc/ssh/ssh_config

RUN export GOOS=$(echo ${TARGETPLATFORM} | cut -d / -f1) && \
    export GOARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) && \
    GOARM=$(echo ${TARGETPLATFORM} | cut -d / -f3); export GOARM=${GOARM:1} && \
    curl -L -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/${GOARCH}/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -L -o /usr/local/bin/fluxctl https://github.com/fluxcd/flux/releases/download/${VERSION}/fluxctl_linux_${GOARCH} && \
    chmod +x /usr/local/bin/fluxctl

COPY --from=xunholy/fluxd:latest /usr/local/bin/fluxd /usr/local/bin/fluxd
RUN chmod +x /usr/local/bin/fluxd

COPY --from=xunholy/kustomize:latest /usr/local/bin/kustomize /usr/local/bin/kustomize
RUN chmod +x /usr/local/bin/kustomize

COPY --from=xunholy/sops:latest /usr/local/bin/sops /usr/local/bin/sops
RUN chmod +x /usr/local/bin/sops

COPY --from=quay.io/squaremo/kubeyaml:0.7.0 /usr/lib/kubeyaml /usr/lib/kubeyaml/
ENV PATH=/bin:/usr/bin:/usr/local/bin:/usr/lib/kubeyaml

ENTRYPOINT ["/sbin/tini", "--", "fluxd"]
