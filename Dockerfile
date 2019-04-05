FROM golang:alpine as builder
MAINTAINER chenkai <orochi.chenkai@gmail.com>
RUN apk update && \
    apk upgrade && \
    apk add git
RUN go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/chenkai2/kcptun/client && go get -ldflags "-X main.VERSION=$(date -u +%Y%m%d) -s -w" github.com/chenkai2/kcptun/server

FROM alpine:3.6
COPY --from=builder /go/bin /bin
EXPOSE 29900/udp
EXPOSE 12948
