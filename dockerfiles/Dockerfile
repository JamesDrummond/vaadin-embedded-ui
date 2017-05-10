FROM eclipse/ubuntu_jdk8

RUN sudo apt-get update && \
	sudo apt-get -y install nano nginx 
	
RUN sudo sh -c 'echo "server { location /container/example/menubar/ { proxy_pass  http://ui_example_menubar/; } }" > /etc/nginx/sites-available/ui_example_menubar && ln -s /etc/nginx/sites-available/ui_example_menubar /etc/nginx/sites-enabled/ui_example_menubar' && \
	sudo sh -c 'echo "server { location /container/example/menuitem1/ { proxy_pass  http://ui_example_menuitem1/; } }" > /etc/nginx/sites-available/ui_example_menuitem1 && ln -s /etc/nginx/sites-available/ui_example_menuitem1 /etc/nginx/sites-enabled/ui_example_menuitem1' && \
	sudo sh -c 'echo "server { location /container/example/menuitem2/ { proxy_pass  http://ui_example_menuitem2/; } }" > /etc/nginx/sites-available/ui_example_menuitem2 && ln -s /etc/nginx/sites-available/ui_example_menuitem2 /etc/nginx/sites-enabled/ui_example_menuitem2'
