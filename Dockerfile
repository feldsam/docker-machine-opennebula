FROM golang:1.13 AS build

COPY . /usr/src/app/
WORKDIR /usr/src/app/src/docker_machine
RUN go get -u github.com/golang/dep/cmd/dep && make

FROM scratch
COPY --from=build /usr/src/app/src/docker_machine/bin/docker-machine-driver-opennebula* /