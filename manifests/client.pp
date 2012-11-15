# == Class: puppet::client
#
# This class manages the puppet client
#
# === Examples
#
#  class { 'puppet::client': }
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
class puppet::client(
  $enable   = true,
  $monitor  = false,
  $options  = {},
) {
  require common::client

  $defaults = {
    'pluginsync'        => 'true',
    'runinterval'       => '1800',
    'server'            => 'localhost',
    'usecacheonfailure' => 'false',
  }

  $options_real = merge($defaults, $options)

  include puppet::params::client
  include puppet::client::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
