FROM centos:7.2.1511

LABEL \
	name="Ansible Semaphore" \
	version="2.0.4"

ADD target_filesystem/ /

RUN yum -y install \
			ansible \
			git \
			wget \
			&& \
		wget "https://github.com/ansible-semaphore/semaphore/releases/download/v2.0.4/semaphore_linux_amd64" && \
		mv semaphore_linux_amd64 /usr/bin/semaphore && \
		chmod +x  /usr/bin/semaphore && \
		chmod +x  /opt/data/semaphore/start.sh && \
		touch /firstrun

# Ports
EXPOSE 3000

WORKDIR /opt/data/semaphore


# Default Command
CMD ["/bin/bash", "-c", "/opt/data/semaphore/start.sh"]
