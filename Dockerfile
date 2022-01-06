from jenkins/ssh-agent:latest

ARG DOCKER_GID=991
 
USER root

RUN apt-get update && apt-get install --no-install-recommends -qqy apt-utils 

RUN apt-get install --no-install-recommends -qqy git-lfs git curl apt-transport-https ca-certificates curl gnupg2 software-properties-common

RUN groupadd -g ${DOCKER_GID} docker \
  && curl -sSL https://get.docker.com/ | sh \
  && apt-get -q autoremove \
  && apt-get -q clean -y \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin

RUN usermod -aG docker jenkins
