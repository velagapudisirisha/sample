FROM tomcat

MAINTAINER 1010101 rajesh@srishsoft.com

COPY index.html usr/local/tomcat/webapps/ROOT/

ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /usr/local/tomcat/webapps/

COPY target/mvn-hello-world.war /usr/local/tomcat/webapps/

USER root
 
EXPOSE 8080

WORKDIR usr/local/tomcat/webapps

CMD ["catalina.sh", "run"]
