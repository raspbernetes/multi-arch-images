FROM six8/pyinstaller-alpine:latest as pyinstaller
ARG VERSION=0.7.0

WORKDIR /tmp
RUN wget https://github.com/squaremo/kubeyaml/archive/${VERSION}.tar.gz \
  && tar xvf ${VERSION}.tar.gz  \
  && mkdir -p /home/kubeyaml \
  && cp /tmp/kubeyaml-${VERSION}/kubeyaml.py /home/kubeyaml/ \
  && cp /tmp/kubeyaml-${VERSION}/requirements.txt /home/kubeyaml/

WORKDIR /home/kubeyaml

#COPY kubeyaml.py requirements.txt ./

RUN /pyinstaller/pyinstaller.sh --noconfirm --clean kubeyaml.py
#RUN ls -R /src/
#RUN cat /src/warn*.txt

FROM alpine:3.9

ENTRYPOINT ["/usr/lib/kubeyaml/kubeyaml"]
COPY --from=pyinstaller /home/kubeyaml/dist/kubeyaml /usr/lib/kubeyaml
