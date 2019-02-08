FROM jenkins/slave
USER root
RUN curl -L "https://download.docker.com/linux/static/stable/x86_64/docker-18.09.1.tgz" -o ./docker.tgz && \
    tar xzvf ./docker.tgz && \
    mv docker/docker /usr/bin/docker && \
    rm -rf docker.tgz docker && \
    curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    chmod +x /usr/bin/docker && \
    groupadd -g 999 docker && \
    usermod -aG docker jenkins && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
