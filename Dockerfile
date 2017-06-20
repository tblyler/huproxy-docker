FROM alpine:3.6
LABEL maintainer "Tony Blyler <me@tonyblyler.com>"

ENV GOPATH /huproxy-build
ENV APK_ADD_PKGS "libc-dev git go@edge"
ENV APK_DEL_PKGS "libc-dev git go"

RUN mkdir -p "${GOPATH}"

# set up edge repo pin for latest golang version
RUN echo '@edge http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories

# install latest golang
RUN apk add --no-cache ${APK_ADD_PKGS}

# build huproxy
RUN go get github.com/google/huproxy

# remove apk packages
RUN apk del ${APK_DEL_PKGS}

# move huproxy binary
RUN mv "${GOPATH}/bin/huproxy" /

# cleanup GOPATH
RUN rm -Rf "${GOPATH}"

EXPOSE 8086

ENTRYPOINT ["./huproxy"]
CMD ["-listen", ":8086"]
