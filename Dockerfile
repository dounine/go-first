# 编译
FROM golang:alpine as builder
WORKDIR /app
COPY . .
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 \
    GOPROXY="https://goproxy.cn,direct"
RUN go build -o app .

# 运行
FROM alpine:latest
COPY --from=builder /app/app /app
EXPOSE 8080
ENTRYPOINT ["/app"]