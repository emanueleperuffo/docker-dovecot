FROM emanueleperuffo/baseimage-debian:latest
MAINTAINER Emanuele Peruffo <info@emanueleperuffo.com>

ENV HOME /root
ADD . /build

ENV SLAPD_HOST ldap.example.com
ENV SLAPD_SEARCH_BASE dc=example,dc=com
ENV HOSTDOMAIN dovecot.example.com

RUN /build/prepare.sh && \
	/build/services.sh && \
	/build/cleanup.sh

VOLUME ["/etc/dovecot", "/var/mail", "/etc/ssl/dovecot"]

EXPOSE 12345 143 110

CMD ["/sbin/my_init"]