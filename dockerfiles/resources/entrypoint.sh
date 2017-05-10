#! /bin/bash
 set -e
 sed -i "s/8080/${NGINX_PORT_SERVE}/" /home/user/nginx/sites-available/ui_example_root
 mkdir -p /projects
 cp -rf /home/user/nginx /projects/
 ## Files in /projects folder are removed by codenvy when started
 ## This workaround will copy nginx folder to /project once temp_workaround is removed
 export TEMP_WORKAROUND_FILE=.$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
 touch /projects/$TEMP_WORKAROUND_FILE
 UNAME_R=${UNAME_R:-$(uname -r)}
 if [[ ${UNAME_R} != 'moby' && ${UNAME_R} != 'boot2docker' ]] ; then 
    ## Non-Blocking for unix only
    inotifywait -e delete /projects/$TEMP_WORKAROUND_FILE | cp -rf /home/user/nginx /projects/ &
 else
    ## Blocking for windows and mac only
    bash -c "while [ -f /projects/$TEMP_WORKAROUND_FILE ]; do sleep 3 ; done; if [ ! -d /projects/nginx/ ]; then cp -rf /home/user/nginx /projects ; fi"  > /dev/null 2>&1 &
 fi
 nginx -c /projects/nginx/nginx.conf
 /usr/sbin/sshd -f ~/.ssh/sshd_config -D &
 exec "$@"