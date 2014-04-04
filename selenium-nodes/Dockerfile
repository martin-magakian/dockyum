FROM ubuntu:12.04
MAINTAINER Martin Magakian "dev.martin.magakian@gmail.com"

#install Java
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties wget
RUN apt-get install -y --no-install-recommends openjdk-7-jre-headless

#download selenium
RUN wget -P /opt http://selenium-release.storage.googleapis.com/2.41/selenium-server-standalone-2.41.0.jar

#install phantomjs
RUN apt-get install bzip2 curl libfreetype6 libfontconfig1 -y
RUN curl -k -O https://phantomjs.googlecode.com/files/phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN tar -xvf phantomjs-1.9.2-linux-x86_64.tar.bz2 && rm phantomjs-1.9.2-linux-x86_64.tar.bz2
RUN mv /phantomjs-1.9.2-linux-x86_64 /usr/local/phantomjs-1.9.2-linux-x86_64
RUN ln -s /usr/local/phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

#install ssh with supervisor
RUN apt-get install -y openssh-server supervisor
RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor
RUN echo 'root:screencast' |chpasswd

#add script
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD startNode.sh /opt/startNode.sh
RUN chmod +x /opt/startNode.sh

#run container: SSH, selenium nodes
EXPOSE 22
CMD ["/usr/bin/supervisord"]
