QUICKSTART
==========

    docker pull alexanderilyin/docker-teamcity-agent
    sudo docker run --restart=always -d -p 9091:9091 -v /var/run/docker.sock:/run/docker.sock alexanderilyin/docker-teamcity-agent:latest -u http://10.0.0.120:8111  -p 9091

ENTRYPOINT
==========

Override default values in `buildAgent.properties` using options in `/entrypoint.sh`

    -u Set serverUrl
    -n Set name
    -w Set workDir
    -t Set tempDir
    -s Set systemDir
    -p Set ownPort
    -a Set authorizationToken
