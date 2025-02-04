FROM golang:alpine AS builder
WORKDIR /app
COPY main.go .
RUN go build -ldflags="-s -w" -o go main.go  
FROM scratch
COPY --from=builder app/go /go
CMD ["/go"]