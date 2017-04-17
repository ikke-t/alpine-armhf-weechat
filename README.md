# alpine-armhf-weechat
Weechat IRC relay in Raspi container.

This is temporary container for myself to host weechat relay in Raspberry Pi running Docker.
Weechat is a IRC client, which can act as a relay. There are several clients for it, native
IRC and weechat itself. Like this simple html5 client: https://www.glowing-bear.org/

If the tmux is got to work, one could attach to instance from docker host. I don't really
have need for such, as I use it as relay for both weechat and IRC protocols.

You can use this e.g.:
```
sudo docker run -d --name weechat \
       -e RELAY_PORT_SSL=8069 \
       -e RELAY_PORT=8067 \
       -e UID=1010 -e GID=1010 \
       -p 8069:8069/tcp \
       -p 8067:8067/tcp \
       -v /mnt/weechat:/weechat \
       ikke/alpine-armhf-weechat:latest 
```
See more about Weechat at: https://weechat.org/

