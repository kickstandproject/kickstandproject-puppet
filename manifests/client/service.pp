# == Class: puppet::client::service
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
class puppet::client::service {
  service { $puppet::params::client::servicename:
    ensure     => $puppet::client::enable,
    enable     => $puppet::client::enable,
    hasrestart => $puppet::params::client::hasrestart,
    hasstatus  => $puppet::params::client::hasstatus,
    require    => Class['puppet::client::config'],
    subscribe  => File[$puppet::params::client::configfile],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
