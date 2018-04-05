FROM ubuntu

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y install telnet firefox git openjdk-8-jdk

# stolen from https://www.scala-sbt.org/1.x/docs/Installing-sbt-on-Linux.html
RUN apt-get -y install apt-transport-https \
 && echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
 && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 \
 && apt-get update \
 && apt-get -y install sbt

WORKDIR /home

RUN git clone https://github.com/dhlab-basel/Knora.git

ENTRYPOINT ["bash"]

