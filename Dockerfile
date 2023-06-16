#build stage
ARG GO_VERSION=1.19.8
ARG ALP_VERSION=3.17

FROM nexus-infra-fgislk.phoenixit.ru/fgislk/devops/harbor/golang:${GO_VERSION}-alpine${ALP_VERSION} AS builder
#FROM golang:${GO_VERSION}-alpine${ALP_VERSION} AS builder
WORKDIR /go/src/app
COPY . .
RUN apk add --no-cache git
RUN go build -o /go/bin/app ./main.go

#final stage
FROM nexus-infra-fgislk.phoenixit.ru/fgislk/devops/harbor/alpine:${ALP_VERSION}
#FROM alpine:${ALP_VERSION}
RUN apk --no-cache add ca-certificates
WORKDIR /app
COPY --from=builder /go/bin/app /app
ENTRYPOINT ./app
LABEL Name=gohello Version=0.0.1
EXPOSE 80

