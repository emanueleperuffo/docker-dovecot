#!/bin/bash
set -e
source /build/buildconfig
set -x

## Installing dovecot
$minimal_apt_get_install dovecot-core dovecot-imapd dovecot-ldap \
	dovecot-lmtpd dovecot-sieve dovecot-managesieved

## Configuring dovecot
cp /build/config/dovecot/conf.d/*.conf /etc/dovecot/conf.d/
cp /build/config/dovecot/sieve/* /etc/dovecot/sieve/*
cp /build/config/dovecot.conf	/etc/dovecot/
sievec /etc/dovecot/sieve/default.sieve