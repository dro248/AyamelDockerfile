# Building the yvideo image from a Dockerfile
FROM tutum/lamp:latest

# Install necessary tools
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    wget \
    software-properties-common

# Install Oracle Java JDK 8
RUN add-apt-repository ppa:webupd8team/java && apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer

# Get Play Framework
RUN wget https://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12.zip

#Copy run & run run.sh script (this is run from Compose file)
COPY runApp.sh /
