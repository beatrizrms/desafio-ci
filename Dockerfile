#part one
FROM golang:1.11 as builder

WORKDIR /
COPY . .
RUN go build -o /go/bin/main .

FROM scratch
WORKDIR /app
COPY --from=builder /go/bin/main /go/bin/main
ENTRYPOINT ["/go/bin/main"]