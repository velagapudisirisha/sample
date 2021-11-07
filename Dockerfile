FROM tomcat:8.0

MAINTAINER 10101

ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /usr/local/tomcat/webapps/

COPY target/mvn-hello-world.war /usr/local/tomcat/webapps/mvn-hello-world.war

USER root

WORKDIR /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["catalina.sh", "run"]
