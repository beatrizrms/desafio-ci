#part one
FROM golang:1.11 as builder

WORKDIR /
COPY . .
RUN go build -o gopath/bin .

FROM scratch
WORKDIR /app
COPY --from=builder /gopath/bin/src /gopath/bin
ENTRYPOINT ["/go/bin/src/main"]