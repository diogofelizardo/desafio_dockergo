FROM golang:alpine3.16 AS build

WORKDIR /app

COPY . .

RUN go build olaMundo.go

FROM scratch

WORKDIR /app

COPY --from=build ./app/olaMundo .

ENTRYPOINT ["./olaMundo"]