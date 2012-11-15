# == Class: puppet::params::client
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
class puppet::params::client inherits puppet::params {
  $defaultsfile = $::operatingsystem ? {
    default => '/etc/default/puppet',
  }

  $hasrestart = $::operatingsystem ? {
    default => true,
  }

  $hasstatus = $::operatingsystem ? {
    default => true,
  }

  $packagename = $::operatingsystem ? {
    default => 'puppet',
  }

  $processname = $::operatingsystem ? {
    default => 'puppet -a agent',
  }

  $servicename = $::operatingsystem ? {
    default => 'puppet',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
