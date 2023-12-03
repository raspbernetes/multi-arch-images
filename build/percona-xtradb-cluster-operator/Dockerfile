FROM golang:1.17.7 as build

ARG VERSION
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT=""
ARG GIT_COMMIT
ARG GIT_BRANCH
ARG BUILD_TIME
ARG GO_LDFLAGS

ENV CGO_ENABLED=0 \
	GOOS=${TARGETOS} \
	GOARCH=${TARGETARCH} \
	GOARM=${TARGETVARIANT}

WORKDIR /go/src/github.com/percona/percona-xtradb-cluster-operator

RUN git clone --depth 1 -b ${VERSION} https://github.com/percona/percona-xtradb-cluster-operator .

COPY . .

RUN mkdir -p build/_output/bin \
    && GOOS=$GOOS GOARCH=$GOARCH CGO_ENABLED=$CGO_ENABLED GO_LDFLAGS=$GO_LDFLAGS \
       go build -mod=vendor -ldflags "-w -s -X main.GitCommit=$GIT_COMMIT -X main.GitBranch=$GIT_BRANCH -X main.BuildTime=$BUILD_TIME" \
           -o build/_output/bin/percona-xtradb-cluster-operator \
               cmd/manager/main.go \
    && cp -r build/_output/bin/percona-xtradb-cluster-operator /usr/local/bin/percona-xtradb-cluster-operator

RUN go get k8s.io/apimachinery/pkg/util/sets \
    && go build -o build/_output/bin/peer-list cmd/peer-list/main.go \
    && cp -r build/_output/bin/peer-list /usr/local/bin/

FROM registry.access.redhat.com/ubi8/ubi-minimal AS ubi8
RUN microdnf update && microdnf clean all

LABEL name="Percona XtraDB Cluster Operator" \
      vendor="Percona" \
      summary="Percona XtraDB Cluster is an active/active high availability and high scalability open source solution for MySQL clustering" \
      description="Percona XtraDB Cluster is a high availability solution that helps enterprises avoid downtime and outages and meet expected customer experience." \
      maintainer="Percona Development <info@percona.com>"

RUN ls -la
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/LICENSE /licenses/
COPY --from=build /usr/local/bin/percona-xtradb-cluster-operator /usr/local/bin/percona-xtradb-cluster-operator
COPY --from=build /usr/local/bin/peer-list /peer-list
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/build/pxc-entrypoint.sh /pxc-entrypoint.sh
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/build/pxc-init-entrypoint.sh /pxc-init-entrypoint.sh
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/build/unsafe-bootstrap.sh /unsafe-bootstrap.sh
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/build/pxc-configure-pxc.sh /pxc-configure-pxc.sh
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/build/liveness-check.sh /liveness-check.sh
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/build/readiness-check.sh /readiness-check.sh
COPY --from=build /go/src/github.com/percona/percona-xtradb-cluster-operator/build/get-pxc-state /get-pxc-state

USER 2
