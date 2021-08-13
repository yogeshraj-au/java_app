FROM tomcat:8
LABEL app=my-app
COPY *.war /usr/local/tomcat/webapps/myweb.war
