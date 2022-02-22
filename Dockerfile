# Base image
FROM ubuntu:latest

# Prepare apt
RUN apt update

# # Prepare dnsmasq
RUN apt -y install dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf

# # Prepare tzdata
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
ENV DEBIAN_FRONTEND=

# # Prepare squid
RUN apt -y install squid
COPY squid.conf /etc/squid/squid.conf

# Prepare startup.sh
COPY startup.sh /startup.sh
RUN chmod 744 /startup.sh

# Port
EXPOSE 53 3128 53/udp

# RUN CMD
CMD ["/startup.sh"]
