#! /bin/bash
 set -e
 /usr/sbin/sshd -f /home/user/.ssh/sshd_config -D &
 exec "$@"