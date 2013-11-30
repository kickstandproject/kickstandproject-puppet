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
  require puppet::server::install
  include puppet::common::config

  File {
    group => $puppet::params::group,
    mode  => $puppet::params::mode,
    owner => $puppet::params::owner,
  }

  concat::fragment { 'puppet.conf-server':
    content => template('puppet/etc/puppet/puppet.conf-server.erb'),
    notify  => Class['puppet::server::service'],
    order   => 02,
    target  => $puppet::params::server::configfile,
  }

  file { "${puppet::params::server::basedir}/autosign.conf":
    ensure  => file,
    content => template('puppet/etc/puppet/autosign.conf.erb'),
    require => File[$puppet::params::server::basedir],
  }

  file { "${puppet::params::server::basedir}/hieradata":
    ensure  => directory,
    group   => $puppet::params::group,
    mode    => $puppet::params::mode,
    require => File[$puppet::params::server::basedir],
    owner   => $puppet::params::owner,
  }
}

# vim:sw=2:ts=2:expandtab
