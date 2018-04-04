FROM centos:7

MAINTAINER nimmis <kjell.havneskold@gmail.com>

RUN yum update -y && \
yum install -y wget && \
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
yum clean all && \
cd /opt && \
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz && \
tar -xzvf apache-maven-3.5.3-bin.tar.gz && \
export M2_HOME=/opt/apache-maven-3.5.3 && \
export M2=$M2_HOME/bin && \
export PATH=$M2:$PATH && \

# Set environment variables.
#ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]