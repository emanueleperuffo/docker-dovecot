FROM emanueleperuffo/baseimage-debian:latest
MAINTAINER Emanuele Peruffo <info@emanueleperuffo.com>

ENV HOME /root
ADD . /build

ENV SLAPD_HOST ldap.example.com
ENV SLAPD_SEARCH_BASE dc=example,dc=com
ENV SLAPD_DN cn=dovecot,dc=example,dc=com
ENV SLAPD_DNPASS pass
ENV POSTMASTER postmaster@example.com
ENV LMTP_HOSTNAME dovecot.example.com

RUN /build/prepare.sh && \
	/build/services.sh && \
	/build/cleanup.sh

VOLUME ["/mail", "/etc/ssl/dovecot"]

EXPOSE 12345 143 110 4190 24

CMD ["/sbin/my_init"]