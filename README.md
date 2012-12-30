# DDNS Management

This is just for my private use.

## Required Packages

* DateTime
* DBI
* DBD::mysql
* Config::Pit
* Net::DNS
* (optional) Smart::Comments

## update_ddns
Perl script that updates DDNS database.
All configurations are done through Pit (Config::Pit in Perl).
This requires MySQL database and a table as `ddns_init.sql`.

### Usage

## update_dns

    $ ./update_dns $DOMAIN $NAME $DATA

will update the $NAME.$DOMAIN record with $DATA.
For instance, when you update <code>foobar.example.com</code> with <code>192.168.0.12</code> the command will be

    $ ./update_ddns example.com foobar 192.168.0.12

## ddns_client
Shell script that invokes update_dns.
It can be configured by <code>envdir</code>.

### <code>$ENVDIR/IP_URL</code>

The script knows the global IP address through accessing this URL.
This <code>IP_URL</code> returns <code>text/plain</code> formatted IP address string.

### <code>$ENVDIR/UPDATE_HOST</code>

Hostname of the DDNS server.

### <code>$ENVDIR/UPDATE_USER</code>

The login name for SSH command.

### <code>$ENVDIR/SSH_OPTS</code>

The command-line options for SSH access to the DDNS server.
It is inteded to specify SSH private key (<code>-i $KEY</code>)

### <code>$ENVDIR/TARGET_DOMAIN</code>

The DNS domain of the client.
It must be contained in `zone` record in DDNS database.

### <code>$ENVDIR/TARGET_NAME</code>

The DNS name of the client.
It will be <code>name</code> record in the DDNS database.

### <code>$ENVDIR/UPDATE_CMD</code>

DDNS update command invoked in the DDNS server.
It is intended to launch <code>update_ddns</code>.

## apply_ddns

    $ ./apply_ddns

on the named server will send DDNS packet (RFC 2136) and set zone.applied 1 if successed.

