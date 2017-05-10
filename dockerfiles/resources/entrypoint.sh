#! /bin/bash
 set -e
 /usr/sbin/sshd -f ~/.ssh/sshd_config -D &
 exec "$@"