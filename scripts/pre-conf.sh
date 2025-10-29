#!/usr/bin/env bash

set -e

wget -O openfire_5_0_2.tar.gz https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_5_0_2.tar.gz
tar xvzf openfire_5_0_2.tar.gz -C /usr/share
rm openfire_5_0_2.tar.gz

cd /usr/share/openfire/plugins/
wget -O search.jar https://igniterealtime.org/projects/openfire/plugins/1.7.5/search.jar
wget -O bookmarks.jar https://www.igniterealtime.org/projects/openfire/plugins/1.2.0/bookmarks.jar 
wget -O httpfileupload.jar https://www.igniterealtime.org/projects/openfire/plugins/1.5.0/httpfileupload.jar 
wget -O monitoring.jar https://www.igniterealtime.org/projects/openfire/plugins/2.7.0/monitoring.jar 
wget -O registration.jar https://www.igniterealtime.org/projects/openfire/plugins/1.9.0/registration.jar 
wget -O externalservicediscovery.jar https://www.igniterealtime.org/projects/openfire/plugins/1.0.4/externalservicediscovery.jar 
wget -O pushnotification.jar https://www.igniterealtime.org/projects/openfire/plugins/1.1.1/pushnotification.jar 
wget -O inverse.jar https://www.igniterealtime.org/projects/openfire/plugins/11.0.1.1/inverse.jar 
wget -O ofmeet.jar https://www.igniterealtime.org/projects/openfire/plugins/0.9.8/ofmeet.jar 
wget -O hazelcast.jar https://www.igniterealtime.org/projects/openfire/plugins/5.5.0.1/hazelcast.jar 
 
