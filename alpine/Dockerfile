FROM alpine

# add some importants tools
RUN apk update && apk add curl nano

ENV EDITOR=/usr/bin/nano

# start crond with log level 8 in foreground
# output to stderr
# put your job in /etc/crontabs/root
CMD ["crond", "-f", "-d", "8"]
