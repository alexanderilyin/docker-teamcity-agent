#!/bin/bash -x
set -e

# CONFIGURE TEAMCITY BUILD AGENT
BUILD_AGENT_PROPERTIES_DEFAULT_FILE=/opt/buildAgent/conf/buildAgent.dist.properties
BUILD_AGENT_PROPERTIES_FILE=/opt/buildAgent/conf/buildAgent.properties
CONTAINER_NAME=$(docker inspect -f '{{.Name}}' $HOSTNAME | sed 's/\///g')

if [ ! -e $BUILD_AGENT_PROPERTIES_FILE ]; then
  cp -v $BUILD_AGENT_PROPERTIES_DEFAULT_FILE $BUILD_AGENT_PROPERTIES_FILE

  # DEFAULTS
  sed -i "s/name.*/name=$CONTAINER_NAME/" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null

  while getopts "u:n:w:t:s:p:a:" opt; do
    case $opt in
      u)
        sed -i "s#serverUrl.*#serverUrl=$OPTARG#" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null
        ;;
      n)
        sed -i "s/name.*/name=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null
        ;;
      w)
        sed -i "s/workDir.*/workDir=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null
        ;;
      t)
        sed -i "s/tempDir.*/tempDir=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null
        ;;
      s)
        sed -i "s/systemDir.*/systemDir=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null
        ;;
      p)
        sed -i "s/ownPort.*/ownPort=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null
        ;;
      a)
        sed -i "s/authorizationToken.*/authorizationToken=$OPTARG/" $BUILD_AGENT_PROPERTIES_FILE 2>/dev/null
        ;;
      \?)
        echo "Invalid option: -$OPTARG" >&2
        ;;
    esac
  done
fi

# RUN TEAMCITY BUILD AGENT
/opt/buildAgent/bin/agent.sh run