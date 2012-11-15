# == Class: puppet::client::config
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
class puppet::client::config {
  include puppet::common::config

  common::function::concat::fragment { 'puppet.conf-client':
    target  => $puppet::params::client::configfile,
    content => template('puppet/etc/puppet/puppet.conf-client.erb'),
    order   => 03,
  }

  file { $puppet::params::client::defaultsfile:
    ensure  => file,
    content => template('puppet/etc/default/puppet.erb'),
    group   => $puppet::params::group,
    mode    => $puppet::params::mode,
    notify  => Class['puppet::client::service'],
    owner   => $puppet::params::owner,
    require => Class['puppet::client::install'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
