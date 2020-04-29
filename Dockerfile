# built from Linuxserver.io Ubuntu Bionic 18.04 LTS
FROM lsiobase/rdesktop-web:bionic-java


LABEL maintainer="Mikey Schaefer <mikeylikesrocks@gmail.com>"
ENV APPNAME="darktable"
ENV DEBIAN_FRONTEND=noninteractive


 RUN \
 echo "*** Install needed apps ***" && \
 apt-get update && \
 apt-get install -qy \
 	wget \
 	gnupg1 \
 	xdotool	
 	
 
 
 RUN \
 echo "*** Add repo and install Darktable 3.0 ***" && \	
 sh -c "echo 'deb http://download.opensuse.org/repositories/graphics:/darktable/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/graphics:darktable.list"  && \
 wget -nv https://download.opensuse.org/repositories/graphics:darktable/xUbuntu_18.04/Release.key -O Release.key && \
 apt-key add - < Release.key && \
 apt-get update && \
 apt-get install -qy \
 darktable && \
 apt-get autoclean && \
 rm -rf \
        /var/lib/apt/lists/* \
        /var/tmp/* \
        /tmp/*

 
 
# add local files
COPY /root /

# ports and volumes
EXPOSE 3389 8080
VOLUME /config
VOLUME /images





