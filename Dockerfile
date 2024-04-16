FROM ubuntu

RUN apt-get -y update
RUN apt-get install -y openjdk-8-jdk wget
WORKDIR /opt
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.87/bin/apache-tomcat-9.0.87.tar.gz
RUN tar -xvzf apache-tomcat-9.0.87.tar.gz
RUN MV apache-tomcat-9.0.87 tomcat

COPY target/welcomeapp.war /opt/tomcat/webapps/

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
