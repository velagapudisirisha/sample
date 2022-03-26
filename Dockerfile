FROM tomcat:8.0

MAINTAINER 1010101

COPY target/mvn-hello-world.war /usr/local/tomcat/webapps/

USER root

WORKDIR /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh", "run"]
