aws s3 cp s3://vdbjavawebapp/myjavaproject/NETFLIX-1.2.2.war 
sudo mv /tmp/NETFLIX-1.2.2.war   /root/apache-tomcat-9.0.97/webapps
sudo service tomcat restart
