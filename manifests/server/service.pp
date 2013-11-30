# == Class: puppet::server::service
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
class puppet::server::service {
  service { $puppet::params::server::servicename:
    ensure     => $puppet::server::enable,
    enable     => $puppet::server::enable,
    hasrestart => $puppet::params::server::hasrestart,
    hasstatus  => $puppet::params::server::hasstatus,
    require    => Class['puppet::server::config'],
    subscribe  => File[$puppet::params::server::configfile],
  }
}

# vim:sw=2:ts=2:expandtab
