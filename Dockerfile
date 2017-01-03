# Building the yvideo image from a Dockerfile
FROM tutum/lamp:latest

# Copy Conf file
COPY application.conf /Ayamel-Examples/conf/

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

# Get Ayamel-Examples AND dependencies
RUN git clone https://github.com/BYU-ARCLITE/Ayamel-Examples.git
RUN git clone https://github.com/BYU-ARCLITE/Ayamel.js.git
RUN git clone https://github.com/BYU-ARCLITE/subtitle-timeline-editor.git
RUN git clone https://github.com/BYU-ARCLITE/EditorWidgets.git
RUN git clone https://github.com/BYU-ARCLITE/TimedText.git

# Cleanup
RUN mv Ayamel.js /var/www/html/ 
RUN mv subtitle-timeline-editor /var/www/html/ 
RUN mv EditorWidgets /var/www/html/ 
RUN mv TimedText /var/www/html
RUN mkdir /PLAY 
RUN unzip /typesafe-activator-1.3.12.zip
RUN mv /activator-dist-1.3.12 /PLAY