FROM golang:1.18 as builder
RUN ls /go
WORKDIR /go/src/k8s.io/autoscaler/cluster-autoscaler/
COPY . .
RUN go build -x -p 4 -o cluster-autoscaler
RUN ls

FROM alpine:latest
RUN apk add ca-certificates
RUN apk add --no-cache libc6-compat
WORKDIR /
COPY --from=builder /go/src/k8s.io/autoscaler/cluster-autoscaler/cluster-autoscaler /
CMD ["./cluster-autoscaler"]
