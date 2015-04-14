FROM alexanderilyin/docker-java

MAINTAINER Alexander Ilyin <ailyin@anchorfree.com>

RUN yum install --assumeyes unzip
RUN curl -LOv https://teamcity.jetbrains.com/update/buildAgent.zip
RUN unzip buildAgent.zip -d /opt/buildAgent
#CMD tar xvf TeamCity-9.0.3.tar.gz -C /opt/
#CMD rm -fv TeamCity-9.0.3.tar.gz

#ENTRYPOINT JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64 /opt/TeamCity/bin/runAll.sh start && tail -F /opt/TeamCity/logs/teamcity-server.log

EXPOSE 9090
