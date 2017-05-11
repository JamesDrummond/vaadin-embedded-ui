FROM eclipse/ubuntu_jdk8

USER root

ENV NGINX_PORT_SERVE=8080

RUN apt-get update && \
	apt-get -y install nano nginx inotify-tools gradle
	
RUN cp -rf /etc/nginx /home/user/ && \
	chown -R user:user /home/user/

USER user

ADD /resources/entrypoint.sh /home/user/entrypoint.sh
ADD /resources/nginx.conf /home/user/nginx/nginx.conf
ADD /resources/ui_example_root /home/user/nginx/sites-available/ui_example_root

RUN chmod u+x /home/user/entrypoint.sh

RUN mkdir -m 700 /home/user/.ssh && \
    sed -i 's/\/etc\/nginx\//\/home\/user\//' /home/user/nginx/nginx.conf && \
	sed 's/UsePrivilegeSeparation yes/UsePrivilegeSeparation no/' /etc/ssh/sshd_config > /home/user/.ssh/sshd_config && \
	chmod 644 /home/user/.ssh/sshd_config && \
	mkdir -p /home/user/.gradle && \
	echo "org.gradle.daemon=true" > /home/user/.gradle/gradle.properties

RUN ln -s ../sites-available/ui_example_root /home/user/nginx/sites-enabled/ui_example_root

CMD tail -f /dev/null
	