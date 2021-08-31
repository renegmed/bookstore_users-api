FROM golang:1.16.2-alpine as builder

ENV LOG_LEVEL=info

WORKDIR /app

COPY . .
 
RUN go mod download
RUN go build -o users-api ./src
 
FROM alpine:latest
RUN apk --no-cache add ca-certificates

WORKDIR /root/
 
COPY --from=builder /app/users-api .
 
# EXPOSE 8081

# ENTRYPOINT ["./items-api"]
