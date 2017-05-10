#! /bin/bash
 set -e
 sed -i "s/8080/${NGINX_PORT_SERVE}/" /home/user/nginx/sites-available/ui_example_root
 mkdir -p /projects
 cp -rf /home/user/nginx /projects/
 ## Files in /projects folder are removed by codenvy when started
 ## This workaround will copy nginx folder to /project once temp_workaround is removed
 touch /projects/temp_workaround
 bash -c "while [ -f /projects/temp_workaround ]; do wait 1 ; done; cp -rf /home/user/nginx /projects" &
 nginx -c /projects/nginx/nginx.conf
 /usr/sbin/sshd -f ~/.ssh/sshd_config -D &
 exec "$@"