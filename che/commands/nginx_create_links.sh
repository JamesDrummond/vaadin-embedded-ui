#!/bin/bash
## This script generates the links files in the project's sites_available folder
## to sites_enabled on host.

echo "server { location /container/example/menubar/ { proxy_pass  http://ui_example_menubar/; } }" > /etc/nginx/sites-available/ui_example_menubar && ln -s /etc/nginx/sites-available/ui_example_menubar /etc/nginx/sites-enabled/ui_example_menubar
echo "server { location /container/example/menuitem1/ { proxy_pass  http://ui_example_menuitem1/; } }" > /etc/nginx/sites-available/ui_example_menuitem1 && ln -s /etc/nginx/sites-available/ui_example_menuitem1 /etc/nginx/sites-enabled/ui_example_menuitem1
echo "server { location /container/example/menuitem2/ { proxy_pass  http://ui_example_menuitem2/; } }" > /etc/nginx/sites-available/ui_example_menuitem2 && ln -s /etc/nginx/sites-available/ui_example_menuitem2 /etc/nginx/sites-enabled/ui_example_menuitem2
