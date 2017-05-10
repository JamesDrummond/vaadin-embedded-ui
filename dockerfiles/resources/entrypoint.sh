#! /bin/bash

 sed -i "s/8080/${NGINX_PORT_SERVE}/" /home/user/nginx/sites-available/ui_example_root
 mkdir -p /projects
 cp -rf /home/user/nginx /projects
 nginx -c /projects/nginx/nginx.conf
 /usr/sbin/sshd -f ~/.ssh/sshd_config -D &
 exec "$@"