FROM golang:latest 
WORKDIR /goalify_app
COPY ./goalify_app/ .
RUN go build -o main main.go
EXPOSE 80
CMD ["./main"]