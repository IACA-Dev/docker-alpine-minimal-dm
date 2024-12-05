FROM alpine:3.20

RUN apk update && apk add bash openbox xterm font-terminus pcmanfm \
    && mkdir -p /root/.config/pcmanfm/default

WORKDIR app

COPY entrypoint.sh .
COPY wallpaper.png .
COPY pcmanfm.conf /root/.config/pcmanfm/default/desktop-items-0.conf

ENTRYPOINT ["bash","entrypoint.sh"]