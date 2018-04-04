FROM centos:7

MAINTAINER nimmis <kjell.havneskold@gmail.com>

#JAVA INSTALLATION
RUN yum update -y && \
yum install -y wget && \
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
yum clean all

#EXPORT JAVA
#RUN export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk >> /etc/profile && \
#export PATH=$JAVA_HOME:$PATH >> /etc/profile 

#MAVEN INSTALLATION
RUN cd /opt && \
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz && \
tar -xzvf apache-maven-3.5.3-bin.tar.gz

#EXPORT MAVEN
#RUN export M2_HOME=/opt/apache-maven-3.5.3 >> /etc/profile && \
#export M2=$M2_HOME/bin >> /etc/profile && \
#export PATH=$M2:$PATH >> /etc/profile &&\

#SOURCE
#RUN source /etc/profile

#SAMPLE POM
ADD pom.xml /opt

# Set environment variables.
ENV HOME /root
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV M2_HOME /opt/apache-maven-3.5.3/bin
ENV PATH $JAVA_HOME:$M2_HOME:$PATH


# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]