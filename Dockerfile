FROM golang:latest

WORKDIR /app

COPY go.mod .

### Setting a proxy for downloading modules
ENV GOPROXY https://proxy.golang.org,direct

### Download Go application module dependencies
RUN go mod download

COPY . .

RUN go build -o math

CMD ["./math"]