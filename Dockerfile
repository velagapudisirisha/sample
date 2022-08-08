FROM tomcat:8.0

MAINTAINER 10101

COPY target/mvn-hello-world.war /usr/local/tomcat/webappps/

USER root

EXPOSE 8080

WORKDIR /usr/local/tomcat/

CMD ["catalina.sh", "run"]
