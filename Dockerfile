FROM golang:1.19.4-alpine3.16
WORKDIR /home/git/
RUN apk add alpine-sdk
RUN git clone https://github.com/nullifier1/gogs
WORKDIR /home/git/gogs
RUN go build -o gogs
RUN go test ./...
EXPOSE 3000
#RUN /home/git/gogs/gogs         
CMD ["sleep","3600"]
