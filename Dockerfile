# Building the yvideo image from a Dockerfile
#FROM ubuntu:latest
FROM tutum/lamp:latest

# Install setup tools
RUN apt-get update
RUN apt-get install -y wget unzip git

# 1) Get Play framework
RUN wget 192.168.1.102:8080/play-scala.zip
RUN unzip /play-scala.zip
RUN mkdir PLAY
RUN mv /play-scala /PLAY/
RUN rm /play-scala.zip

# 2) Get Ayamel-Examples
RUN git clone https://github.com/BYU-ARCLITE/Ayamel-Examples.git

# 3) Get Ayamel dependencies
RUN git clone https://github.com/BYU-ARCLITE/Ayamel.js.git
RUN git clone https://github.com/BYU-ARCLITE/subtitle-timeline-editor.git
RUN git clone https://github.com/BYU-ARCLITE/EditorWidgets.git
RUN git clone https://github.com/BYU-ARCLITE/TimedText.git

RUN mv Ayamel.js /var/www/html/
RUN mv subtitle-timeline-editor /var/www/html/
RUN mv EditorWidgets /var/www/html/
RUN mv TimedText /var/www/html/