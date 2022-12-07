FROM golang:1.18 AS build

WORKDIR /

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app main.go

FROM scratch

WORKDIR /

COPY --from=build /app /

CMD ["/app"]