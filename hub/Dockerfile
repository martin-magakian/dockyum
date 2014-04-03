FROM ubuntu:12.04

RUN apt-get update
RUN apt-get install software-properties-common python-software-properties -y
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get install oracle-java7-installer -y



RUN wget -P /opt http://selenium-release.storage.googleapis.com/2.41/selenium-server-standalone-2.41.0.jar

EXPOSE 4444

CMD ["java", "-jar", "/opt/selenium-server-standalone-2.41.0.jar", "-role", "hub"]
