#!/bin/bash -x
set -e

# RUN DOCKER
service docker start

# CONFIGURE TEAMCITY BUILD AGENT
BUILD_AGENT_PROPERTIES_DEFAULT_FILE=/opt/buildAgent/conf/buildAgent.dist.properties
BUILD_AGENT_PROPERTIES_FILE=/opt/buildAgent/conf/buildAgent.properties
cp -v $BUILD_AGENT_PROPERTIES_DEFAULT_FILE $BUILD_AGENT_PROPERTIES_FILE
while getopts "u:n:w:t:s:p:a:" opt; do
  case $opt in
    u)
      sed -i "s#serverUrl.*#serverUrl=$OPTARG#" $BUILD_AGENT_PROPERTIES_FILE
      ;;
    n)
      sed -i "s/name.*/name=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE
      ;;
    w)
      sed -i "s/workDir.*/workDir=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE
      ;;
    t)
      sed -i "s/tempDir.*/tempDir=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE
      ;;
    s)
      sed -i "s/systemDir.*/systemDir=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE
      ;;
    p)
      sed -i "s/ownPort.*/ownPort=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE
      ;;
    a)
      sed -i "s/authorizationToken.*/authorizationToken=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

cat $BUILD_AGENT_PROPERTIES_FILE

# RUN TEAMCITY BUILD AGENT
/opt/buildAgent/bin/agent.sh run