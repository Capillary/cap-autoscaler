
ARG BASEIMAGE=k8s.gcr.io/debian-base-amd64:v1.0.0
FROM $BASEIMAGE
LABEL maintainer="Marcin Wielgus <mwielgus@google.com>"

ENV DEBIAN_FRONTEND noninteractive

ADD cluster-autoscaler cluster-autoscaler
ADD run.sh run.sh

CMD ./run.sh
