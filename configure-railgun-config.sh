#!/bin/sh

# Fetch the public IP address
RG_HOST=$(curl -s https://icanhazip.com)

cat <<END
activation.token = ${RG_TOKEN}
activation.railgun_host = ${RG_HOST}
wan.port = 2408
map.file = /etc/railgun/railgun-nat.conf
stderr.file = /var/log/railgun/panic.log
pid.file = /var/run/railgun/railgun.pid
log.level = 5
validate.cert = 0
ca.bundle = /etc/ssl/railgun-ca-certs.crt
memcached.servers = /tmp/memcached.sock
memcached.timeout = 100
memcached.limit = 1000000
memcached.expiration = 0
stream.size = 2500000
stats.enabled = 0
stats.log = 0
stats.interval = 0
END
