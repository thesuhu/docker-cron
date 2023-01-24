# docker-cron

![GitHub workflow](https://github.com/thesuhu/docker-cron/actions/workflows/docker-image.yml/badge.svg) ![Docker pull](https://img.shields.io/docker/pulls/thesuhu/docker-cron)

Docker images used to run cron job in a Docker container.

## Usage

First, create config file. For example create file `cronjobs`:

### alpine

```sh
# example alpine config crond
# do daily/weekly/monthly maintenance
# min   hour    day     month   weekday command
# */15    *       *       *       *       run-parts /etc/periodic/15min
# 0       *       *       *       *       run-parts /etc/periodic/hourly
# 0       2       *       *       *       run-parts /etc/periodic/daily
# 0       3       *       *       6       run-parts /etc/periodic/weekly
# 0       5       1       *       *       run-parts /etc/periodic/monthly
*       *       *       *       *       date
*       *       *       *       *       echo "${CUSTOM_ENV_VAR}"
```

Then change ownership to root `chown root:root crontabs` and run container and mount config file to `/etc/crontabs/root` inside container: 

```sh
docker run -d --name cron -e CUSTOM_ENV_VAR=foobar -v `pwd`/cronjobs:/etc/crontabs/root thesuhu/docker-cron
```

Restart container after modify the config file on host.
