FROM java

MAINTAINER Alexander Ilyin <ailyin@anchorfree.com>

# INSTALL TEAMCITY BUILD AGENT
RUN mkdir -v /opt/buildAgent \
    && cd /opt/buildAgent \
    && curl -LSs https://teamcity.jetbrains.com/update/buildAgent.zip | jar xvf /dev/stdin \
    && chmod -c +x /opt/buildAgent/bin/agent.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9090
