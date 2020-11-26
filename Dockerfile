#part one
FROM golang:1.11 as builder

WORKDIR /
COPY . .
RUN go build -o gopath/bin .

FROM scratch
WORKDIR /app
COPY --from=builder /go/bin /go/bin/src
ENTRYPOINT ["/go/bin/src/main"]