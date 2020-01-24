FROM debian

ARG host

ENV GITLAB_HOST=$host

RUN apt-get update -y &&\
    apt-get upgrade -y

RUN echo "postfix postfix/mailname string example.com" | debconf-set-selections &&\ 
    echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

RUN apt-get -y install curl &&\
    apt-get -y install openssh-server &&\
    apt-get -y install ca-certificates &&\
    apt-get -y install postfix

WORKDIR /tmp

RUN curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

RUN chmod 777 script.deb.sh 
RUN ./script.deb.sh

RUN apt-get update -y

WORKDIR /

RUN apt-get -y install gitlab-ce
RUN echo "grafana['enable'] = false" >> /etc/gitlab/gitlab.rb
RUN echo "external_url \"http://"$host"\"" >> /etc/gitlab/gitlab.rb
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 8080 443 80 22

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null
