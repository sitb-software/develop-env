##
# 开发环境
# 1、NVM
##

FROM ubuntu

MAINTAINER Sean <sean.snow@live.com>

# Install Tools
RUN apt-get update && apt-get install -y git vim; \

	# Clean up
	apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# create user
# RUN useradd -r -m -c "Develop Account" -s /bin/bash develop

# ENV DEV_USER_HOME=/home/develop
ENV DEV_USER_HOME=/root

# Install NVM
# RUN export NVM_DIR="${DEV_USER_HOME}/.nvm" && ( \
#      git clone https://github.com/creationix/nvm.git "$NVM_DIR"; \
#      cd "$NVM_DIR"; \
#      git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`; \
#    ) && . "$NVM_DIR/nvm.sh"

# RUN echo 'export NVM_DIR="$HOME/.nvm"' >> ${DEV_USER_HOME}/.bashrc; \
#    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> ${DEV_USER_HOME}/.bashrc

RUN mkdir /backup && cp ${DEV_USER_HOME}/.bashrc ${DEV_USER_HOME}/.profile /backup

COPY tools.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/tools.sh

VOLUME ${DEV_USER_HOME}

WORKDIR ${DEV_USER_HOME}

ENTRYPOINT ["tools.sh"]
CMD ["/bin/bash"]
