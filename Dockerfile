FROM golang:1.21-bullseye AS builder

WORKDIR /work

COPY . /work
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /app

FROM gcr.io/distroless/static

COPY --from=builder /app /app

ENTRYPOINT ["/app"]
