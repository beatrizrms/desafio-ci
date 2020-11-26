#part one
FROM golang:1.15-buster as builder

WORKDIR /src
COPY go.* ./
RUN go build -o .

FROM scratch
WORKDIR /app
COPY --from=builder /src /src
ENTRYPOINT ["/src"]