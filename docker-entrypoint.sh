#!/usr/bin/env bash

/usr/bin/memcached -d -u memcached -s /tmp/memcached.sock -m 4000M -c 1024

# Generate railgun config
/usr/bin/configure-railgun-config.sh > /etc/railgun/railgun.conf
/usr/bin/rg-listener -config=/etc/railgun/railgun.conf
