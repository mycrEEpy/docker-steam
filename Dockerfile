FROM centos:7
MAINTAINER Tobias Germer

# Install the dependencies required to run SteamCMD
RUN yum install glibc.i686 libstdc++.i686 -y && \
    yum update -y

# Add user to run steam and create directory for files
RUN useradd -m steam && \
    mkdir /steam

# Download SteamCMD
RUN wget -P /steam/ https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz

# Extract the contents to the directory
RUN tar -xvzf /steam/steamcmd_linux.tar.gz -C /steam/

# Change owner rights
RUN chown -R steam:steam /steam/

WORKDIR /steam/steamcmd/

CMD /steam/steamcmd/steamcmd.sh
