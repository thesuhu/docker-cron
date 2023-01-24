FROM debian:buster-slim

# in case job need curl
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install -y cron curl \
    && rm -rf /var/lib/apt/lists/* \
    && which cron \
    && rm -rf /etc/cron.*/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# more info: https://manpages.ubuntu.com/manpages/trusty/man8/cron.8.html
CMD ["cron","-f", "-L", "2"]