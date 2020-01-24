##### Usage #####
# Build : docker build -t ${NAME} .
# Run : docker run --rm -it -p 9987:9987/udp -p 10011:10011 -p 30033:30033 ${NAME}

FROM debian

ENV TS3SERVER_LICENSE=accept

RUN apt-get update -y &&\
    apt-get upgrade -y &&\
    apt-get install wget -y &&\
    apt-get install bzip2 -y

WORKDIR /opt

RUN wget https://files.teamspeak-services.com/releases/server/3.8.0/teamspeak3-server_linux_amd64-3.8.0.tar.bz2

RUN tar xfv teamspeak3-server_linux_amd64-3.8.0.tar.bz2 &&\
    mv /opt/teamspeak3-server_linux_amd64 /opt/teamspeak_server &&\
    rm -rf teamspeak3-server_linux_amd64-3.8.0.tar.bz2

ENTRYPOINT sh /opt/teamspeak_server/ts3server_minimal_runscript.sh

