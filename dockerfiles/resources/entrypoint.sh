#! /bin/bash
 set -e
 sed -i "s/8080/${NGINX_PORT_SERVE}/" /home/user/sites-available/ui_example_root
 cp -rf /home/user/nginx /projects/nginx_conf
 nginx -c /projects/nginx_conf/nginx.conf
 /usr/sbin/sshd -f ~/.ssh/sshd_config -D &
 exec "$@"