FROM tomcat:8

MAINTAINER 10101

ADD https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war /usr/local/tomcat/webapps/

COPY target/mvn-hello-world.war /usr/local/tomcat/webapps/

USER root

EXPOSE 8080

WORKDIR /usr/local/tomcat

CMD ["catalina.sh", "run"]
