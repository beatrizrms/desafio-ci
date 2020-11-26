#part one
FROM golang:1.11 as builder

WORKDIR /
COPY . .
RUN go build -o go/bin .

FROM scratch
WORKDIR /app
COPY --from=builder /go/bin/src /go/bin
ENTRYPOINT ["/go/bin/src/main"]