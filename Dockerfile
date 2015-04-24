FROM java

MAINTAINER Alexander Ilyin <ailyin@anchorfree.com>

ADD https://teamcity.jetbrains.com/update/buildAgent.zip /opt/buildAgent.zip
RUN unzip /opt/buildAgent.zip -d /opt/buildAgent
RUN rm -rfv buildAgent.zip
RUN chmod -c +x /opt/buildAgent/bin/agent.sh

RUN echo serverUrl=http://server:8111/ > /opt/buildAgent/conf/buildAgent.properties
RUN echo authorizationToken= >> /opt/buildAgent/conf/buildAgent.properties
RUN echo name= >> /opt/buildAgent/conf/buildAgent.properties
RUN echo ownPort=9090 >> /opt/buildAgent/conf/buildAgent.properties
RUN echo systemDir=../system >> /opt/buildAgent/conf/buildAgent.properties
RUN echo tempDir=../temp >> /opt/buildAgent/conf/buildAgent.properties
RUN echo workDir=../work >> /opt/buildAgent/conf/buildAgent.properties

CMD /opt/buildAgent/bin/agent.sh run

EXPOSE 9090
