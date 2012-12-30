#!/usr/bin/env perl
package DBH;

use strict;
use warnings;
use 5.010;

use DBI;
use Config::Pit;
#use Smart::Comments;

our $dbh;

sub _getDBH {
    # DBH
    my $config;
    $config = pit_get("update_ddns", require => {
            hostname => 'hostname',
            database => 'database',
            username => 'username',
            password => 'password',
        });
    ### $config
    $config = pit_set("update_ddns", data => {
            hostname => $config->{hostname},
            database => $config->{database},
            username => $config->{username},
            password => $config->{password},
        });
    my $dbh = DBI->connect(
        "DBI:mysql:$config->{database}:$config->{hostname}",
        $config->{username},
        $config->{password},
        { RaiseError=>1, PrintError=>1, AutoCommit=>0, }
    );
    return $dbh;
}

sub BEGIN {
    $dbh = _getDBH();
}

1;

