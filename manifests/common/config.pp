# == Class: puppet::common::config
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
class puppet::common::config {
  File {
    group => $puppet::params::group,
    mode  => $puppet::params::mode,
    owner => $puppet::params::owner,
  }

  file { $puppet::params::basedir:
    ensure  => directory,
    force   => true,
    purge   => true,
    recurse => true,
  }

  concat { $puppet::params::configfile:
    group => $puppet::params::group,
    mode  => $puppet::params::mode,
    owner => $puppet::params::owner,
  }

  concat::fragment { 'puppet.conf-header':
    content => template('puppet/etc/puppet/puppet.conf-header.erb'),
    order   => 01,
    target  => $puppet::params::configfile,
  }

  file { [
    "${puppet::params::basedir}/manifests",
    "${puppet::params::basedir}/modules",
    "${puppet::params::basedir}/templates",
  ]:
    ensure  => directory,
    require => File[$puppet::params::basedir],
  }
}

# vim:sw=2:ts=2:expandtab
