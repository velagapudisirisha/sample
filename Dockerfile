FROM tomcat:8.0

MAINTAINER 101010

COPY target/mvn-hello-world.war /usr/local/tomcat/webapps/mvn-hello-world.war

USER root

WORKDIR /usr/local/tomcat/webapps

EXPOSE 8080

CMD ["run", "catalina.sh]
