@echo off

set IMAGE=a7base-ds
set VERSION=v1
set PREFIX=registry2.swarm.devfactory.com/versata/artemis/
rem set PREFIX=

docker -H build.swarm.devfactory.com build -f Dockerfile -t %PREFIX%%IMAGE%:%VERSION% .
rem docker push %PREFIX%%IMAGE%:%VERSION%
rem docker tag %PREFIX%%IMAGE%:%VERSION% %PREFIX%%IMAGE%:latest
