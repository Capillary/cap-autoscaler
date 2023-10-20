ARG BASEIMAGE=gcr.io/distroless/static:nonroot-amd64
FROM $BASEIMAGE
LABEL maintainer="Marcin Wielgus <mwielgus@google.com>"

COPY cluster-autoscaler-amd64 /cluster-autoscaler
WORKDIR /
CMD ["/cluster-autoscaler"]