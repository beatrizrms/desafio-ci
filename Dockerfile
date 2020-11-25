#part one
FROM golang:1.11 as builder

WORKDIR /
COPY . .
RUN go build -o /go/bin/src .

FROM scratch
WORKDIR /app
COPY --from=builder /go/bin/src /go/bin/src
ENTRYPOINT ["/go/bin/main"]