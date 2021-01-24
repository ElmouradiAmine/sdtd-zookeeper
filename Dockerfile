FROM centos:latest

RUN yum -y update;
RUN yum -y clean all;

# SET UP THE ENVIRONNEMENT
RUN yum install -y  wget dialog curl sudo lsof vim telnet nano openssh-server openssh-clients bzip2 passwd tar bc git unzip
# INSTALL JAVA 1.8
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel 

# CREATE USER
RUN useradd guest -u 1000
RUN echo guest | passwd guest --stdin

ENV HOME /home/guest
WORKDIR $HOME

# DOWNLOAD ZOOKEEPER
RUN wget https://apache.mirrors.benatherton.com/zookeeper/zookeeper-3.6.2/apache-zookeeper-3.6.2-bin.tar.gz
RUN tar xvzf apache-zookeeper-3.6.2-bin.tar.gz
RUN mv apache-zookeeper-3.6.2-bin zookeeper
RUN rm apache-zookeeper-3.6.2-bin.tar.gz

# Copy the startup script
ADD startup_script.sh /usr/local/bin/startup_script.sh
RUN chmod +x /usr/local/bin/startup_script.sh

# COPY ZOO CONFIG
COPY ./zoo.cfg $HOME/zookeeper/conf/zoo.cfg 

EXPOSE 2181 2888 3888

ENTRYPOINT [ "startup_script.sh" ]


