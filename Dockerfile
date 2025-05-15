FROM golang:1.22-alpine3.19 as builder

LABEL authors="serhiihulko"

WORKDIR /build

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN GOARCH=amd64 CGO_ENABLED=0 GOOS=linux go build -o app .
RUN tar -czvf app.tar.gz app config.ini

FROM alpine:3.15
WORKDIR /app
COPY --from=builder /build/app.tar.gz ./
RUN tar -xzvf app.tar.gz && \
    rm app.tar.gz && \
    mkdir /app/logs && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/UTC /etc/localtime

EXPOSE 80
ENTRYPOINT ["./app"]