FROM tomcat:8
LABEL app=my-app
RUN  cd /var/jenkins_home/workspace/dsljobs/javabuild@2/
COPY target/*.war /usr/local/tomcat/webapps/myweb.war
