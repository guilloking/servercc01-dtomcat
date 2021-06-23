FROM tomcat:jdk11-slim

LABEL maintainer="guillermoreyesn@gmail.com"

#RUN rm -rf /usr/local/tomcat/webapps/*

RUN apt update && apt-get install nano

COPY .docker/tomcat/tomcat-users.xml /usr/local/tomcat/conf/
COPY .docker/tomcat/context.xml /usr/local/tomcat/conf/
COPY .docker/tomcat/context.xml /usr/local/tomcat/webapps/manager/META-INF/

RUN ln -s /usr/local/tomcat/webapps.dist/manager webapps/manager
RUN ln -s /usr/local/tomcat/webapps.dist/host-manager webapps/host-manager
RUN ln -s /usr/local/tomcat/webapps.dist/ROOT webapps/ROOT

EXPOSE 8080

CMD [ "catalina.sh","run" ]