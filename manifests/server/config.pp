# == Class: puppet::server::config
#
# === Authors
#
# Paul Belanger <paul.belanger@polybeacon.com>
#
# === Copyright
#
# Copyright (C) 2012, PolyBeacon, Inc.
#
# This program is free software, distributed under the terms
# of the Apache License, Version 2.0. See the LICENSE file at
# the top of the source tree.
#
class puppet::server::config {
  require apache::server
  include puppet::common::config

  common::function::concat::fragment { 'puppet.conf-server':
    target  => $puppet::params::server::configfile,
    content => template('puppet/etc/puppet/puppet.conf-server.erb'),
    notify  => Class['apache::common::service'],
    order   => 02,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
