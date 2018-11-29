FROM debian:stretch-slim

ENV RG_TOKEN ""

RUN apt update && apt install -y --no-install-recommends gnupg1 gnupg1-curl curl dirmngr ca-certificates memcached \
  && useradd --no-create-home memcached \
  && echo 'deb http://pkg.cloudflare.com/ stretch main' | tee /etc/apt/sources.list.d/cloudflare-main.list \
  && apt-key adv --fetch-keys http://pkg.cloudflare.com/pubkey.gpg \
  && apt update && apt install -y --no-install-recommends railgun-stable \
  && apt autoremove && apt clean && rm -rf /var/cache/apt

RUN ln -sf /dev/stdout /var/log/messages

COPY docker-entrypoint.sh /

COPY configure-railgun-config.sh /usr/bin/configure-railgun-config.sh

RUN chown railgun:railgun /etc/railgun/railgun.conf

USER railgun

EXPOSE 2408

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
