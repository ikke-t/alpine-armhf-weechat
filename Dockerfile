FROM forumi0721/alpine-armhf-base:latest
MAINTAINER Ilkka Tengvall <ilkka.tengvall@iki.fi>

ENV RELAY_PORT=8067 RELAY_PORT_SSL=8069 UID=1100 GID=1100
EXPOSE ${RELAY_PORT}
EXPOSE ${RELAY_PORT_SSL}

ENV LANG C.UTF-8
ENV HOME /weechat
ENV WEECHAT_HOME ${HOME}/.weechat

RUN apk -U upgrade && apk add weechat tmux && \
    mkdir -p /${HOME}

WORKDIR $HOME

COPY run.sh /usr/local/bin/run.sh

RUN mkdir -p ${HOME}/.weechat \
    && addgroup -g ${GID} weechat\
    && adduser -u ${UID} -h ${HOME} -D -s /bin/bash -G weechat weechat \
    && chown -R weechat:weechat ${HOME} \
    && chmod +x /usr/local/bin/run.sh

ENV TERM xterm

ENTRYPOINT ["/usr/local/bin/run.sh"]
