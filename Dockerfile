FROM golang:1.22-alpine AS builder
WORKDIR /src

COPY go.mod ./
COPY main.go ./

RUN go build -o server .

FROM alpine:3.20
WORKDIR /app

COPY --from=builder /src/server /app/server

EXPOSE 8080

CMD ["./app"]
