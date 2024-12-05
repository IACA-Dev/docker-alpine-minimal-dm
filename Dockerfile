FROM alpine:3.20


WORKDIR /context

COPY entrypoint.sh .
COPY wallpaper.png .
COPY pcmanfm.conf /root/.config/pcmanfm/default/desktop-items-0.conf
COPY context.sh /sbin/context



RUN apk update && apk add bash openbox xterm font-terminus pcmanfm \
    && mkdir -p /root/.config/pcmanfm/default \
    && chmod +x /sbin/context

ENTRYPOINT ["bash","entrypoint.sh"]