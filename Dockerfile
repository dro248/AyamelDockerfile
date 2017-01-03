# Building the yvideo image from a Dockerfile
FROM tutum/lamp:latest

# Get Play
COPY play-scala.zip /

# Install necessary tools
RUN apt-get update && apt-get install -y \
    git \
    unzip

# Get Ayamel-Examples AND dependencies
RUN git clone https://github.com/BYU-ARCLITE/Ayamel-Examples.git
RUN git clone https://github.com/BYU-ARCLITE/Ayamel.js.git
RUN git clone https://github.com/BYU-ARCLITE/subtitle-timeline-editor.git
RUN git clone https://github.com/BYU-ARCLITE/EditorWidgets.git
RUN git clone https://github.com/BYU-ARCLITE/TimedText.git

RUN mv Ayamel.js /var/www/html/ 
RUN mv subtitle-timeline-editor /var/www/html/ 
RUN mv EditorWidgets /var/www/html/ 
RUN mv TimedText /var/www/html
RUN mkdir /PLAY 
RUN unzip /play-scala.zip 
RUN mv /play-scala /PLAY
