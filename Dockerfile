FROM ghcr.io/penguincloud/core AS BUILD
LABEL company="Penguin Tech Group LLC"
LABEL org.opencontainers.image.authors="info@penguintech.group"
LABEL license="GNU AGPL3"

# GET THE FILES WHERE WE NEED THEM!
COPY . /opt/web2py/
WORKDIR /opt/web2py

RUN apt-get update 
# PUT YER ARGS in here
ARG APP_TITLE="PTGAPP" # Change this to actual title for Default

# BUILD IT!
RUN ansible-playbook entrypoint.yml -c local --tags=build

# PUT YER ENVS in here
ENV HELLO="WORLD"

# Switch to non-root user, if you change run-user variable update this one too
#USER www-data

# Entrypoint time (aka runtime)
ENTRYPOINT ["/bin/bash","/opt/manager/entrypoint.sh"]
