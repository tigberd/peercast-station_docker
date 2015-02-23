FROM ubuntu:latest

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" >> /etc/apt/sources.list.d/mono-xamarin.list

RUN apt-get update && \
      apt-get install -y mono-complete wget unzip && \
      apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN mkdir -p /usr/src/src
WORKDIR /usr/src/src

RUN wget http://www.pecastation.org/files/PeerCastStation-1.8.0.zip
RUN unzip PeerCastStation-1.8.0.zip

ADD ./entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
