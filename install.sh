aws s3 cp s3://vdbjavawebapp/myjavaproject/myjavawebapp.war
sudo mv /tmp/myjavawebapp.war  /root/apache-tomcat-9.0.97/webapps
sudo service tomcat restart
