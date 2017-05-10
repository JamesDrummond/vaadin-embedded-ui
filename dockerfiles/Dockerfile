FROM eclipse/ubuntu_jdk8

USER root

ENV NGINX_PORT_SERVE=8080

RUN apt-get update && \
	apt-get -y install nano nginx 
	
RUN cp -rf /etc/nginx /home/user/ && \
	chown -R user:user /home/user/

RUN ln -s /home/user/sites-available/ui_example_root /home/user/sites-enabled/ui_example_root

USER user

RUN sed -i 's/\/etc\/nginx\//\/home\/user\//' /home/user/nginx.conf && \
	sed 's/UsePrivilegeSeparation yes/UsePrivilegeSeparation no/' /etc/ssh/sshd_config > ~/.ssh/sshd_config && \
	chmod 644 ~/.ssh/sshd_config

ADD /resources/entrypoint.sh /home/user/entrypoint.sh
ADD /resources/nginx.conf /home/user/nginx/nginx.conf
ADD /resources/ui_example_root /home/user/sites-available/ui_example_root

RUN chmod u+x /home/user/entrypoint.sh

CMD tail -f /dev/null
