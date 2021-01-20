FROM tomcat:8

MAINTAINER 10101

COPY target/mvn-hello-world.war /usr/local/tomcat/webapps/

EXPOSE 8080

USER root

WORKDIR /usr/local/tomcat/webapps 

CMD ["catalina.sh", "run"]
