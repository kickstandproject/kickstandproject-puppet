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

  File {
    group => $puppet::params::group,
    mode  => $puppet::params::mode,
    owner => $puppet::params::owner,
  }

  common::function::concat::fragment { 'puppet.conf-server':
    target  => $puppet::params::server::configfile,
    content => template('puppet/etc/puppet/puppet.conf-server.erb'),
    notify  => Class['apache::common::service'],
    order   => 02,
  }

  file { "${puppet::params::server::basedir}/autosign.conf":
    ensure  => file,
    content => template('puppet/etc/puppet/autosign.conf.erb'),
    require => File[$puppet::params::server::basedir],
  }

  apache::function::site::available { $::fqdn:
    content => template('puppet/etc/apache2/conf.d/puppetmaster.conf.erb'),
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
