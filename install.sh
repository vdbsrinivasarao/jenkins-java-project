aws s3 cp s3://vdbjavawebapp/myjavaproject/myjavaproject.war
sudo mv /tmp/myjavaproject.war  /root/apache-tomcat-9.0.97/webapps
sudo service tomcat restart
