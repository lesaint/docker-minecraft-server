FROM ubuntu:14.04.1

MAINTAINER Sébastien Lesaint

# install generic dependencies
RUN apt-get update -yy && sudo apt-get -yy install vim wget

# install Java
RUN cd ~ && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -qO- http://download.oracle.com/otn-pub/java/jdk/8u5-b13/jdk-8u5-linux-x64.tar.gz | tar xvz && ln -s jdk1.8.0_05 jdk

# install minecraft server
RUN mkdir ~/minecraft && cd ~/minecraft && echo '#!/bin/bash\
cd ~/minecraft && ~/jdk/bin/java -jar ~/minecraft/minecraft_server.1.8.jar -Xmx1024M -Xms1024M nogui' > ~/minecraft.sh && chmod +x ~/minecraft.sh

# start Minecraft server
CMD ~/minecraft.sh
