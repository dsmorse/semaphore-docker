FROM centos:7.2.1511

LABEL \
	name="Ansible Semaphore" \
	version="2.0.4"

RUN yum -y install \
			ansible \
			git \
			wget \
			&& \
		wget "https://github.com/ansible-semaphore/semaphore/releases/download/v2.0.4/semaphore_linux_amd64" && \
		mv semaphore_linux_amd64 /usr/bin/semaphore && \
		chmod +x  /usr/bin/semaphore

ADD semaphore_config.json /opt/data/semaphore/semaphore_config.json

# Ports
EXPOSE 3000

# Default Command
CMD ["/bin/bash", "-c", "sed -i s/MYSQL_IP_ADDR/${MYSQL_PORT_3306_TCP_ADDR}/ /opt/data/semaphore/semaphore_config.json && semaphore -config /opt/data/semaphore/semaphore_config.json"]
