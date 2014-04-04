FROM ubuntu:12.04
MAINTAINER Martin Magakian "dev.martin.magakian@gmail.com"

#install Java
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties wget
RUN apt-get install -y --no-install-recommends openjdk-7-jre-headless

#download selenium
RUN wget -P /opt http://selenium-release.storage.googleapis.com/2.41/selenium-server-standalone-2.41.0.jar

EXPOSE 4444
CMD ["java", "-jar", "/opt/selenium-server-standalone-2.41.0.jar", "-role", "hub"]
