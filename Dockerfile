FROM java

MAINTAINER Alexander Ilyin <ailyin@anchorfree.com>

# INSTALL TEAMCITY BUILD AGENT

RUN curl -vL --output /opt/buildAgent.zip https://teamcity.jetbrains.com/update/buildAgent.zip && \
    unzip /opt/buildAgent.zip -d /opt/buildAgent && \
    rm -rfv /opt/buildAgent.zip

RUN chmod -c +x /opt/buildAgent/bin/agent.sh

# INSTALL DOCKER
RUN wget -qO- https://get.docker.com/ | sh

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9090
