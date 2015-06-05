#!/bin/bash
set -e
source /build/buildconfig
set -x

## Installing dovecot
$minimal_apt_get_install dovecot-core dovecot-imapd dovecot-pop3d dovecot-ldap \
	dovecot-lmtpd dovecot-sieve dovecot-managesieved

## Configuring dovecot
mkdir /etc/dovecot/sieve
cp /build/config/dovecot/conf.d/*.conf /etc/dovecot/conf.d/
cp /build/config/dovecot/sieve/* /etc/dovecot/sieve/
sievec /etc/dovecot/sieve/default.sieve

## Enabling dovecot daemon
mkdir /etc/service/dovecot
cp /build/runit/dovecot /etc/service/dovecot/run

# Creating vmail user
groupadd vmail -g 5000 && useradd -u 5000 -g vmail vmail -d /mail
mkdir /mail && chown vmail:vmail /mail