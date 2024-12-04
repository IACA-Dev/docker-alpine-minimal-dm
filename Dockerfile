FROM alpine:3.20

RUN apk update && apk add bash openbox xterm font-terminus

COPY entrypoint.sh .

ENTRYPOINT ["bash","entrypoint.sh"]