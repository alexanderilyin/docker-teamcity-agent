QUICKSTART
==========

    docker pull alexanderilyin/docker-teamcity-agent
    docker run -ti --privileged=true alexanderilyin/docker-teamcity-agent -u http://server:8111/

ENTRYPOINT
==========

Override default values in in `buildAgent.properties` using options in `/entrypoint.sh`

    -u Set serverUrl
    -n Set name
    -w Set workDir
    -t Set tempDir
    -s Set systemDir
    -p Set ownPort
    -a Set authorizationToken
