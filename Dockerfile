FROM certbot/certbot

RUN apt-get update && apt-get install -y cron

COPY ./crontab /etc/cron.d/certbot-renew

RUN chmod 0644 /etc/cron.d/certbot-renew

RUN crontab /etc/cron.d/certbot-renew

CMD ["crond", "-f"]
