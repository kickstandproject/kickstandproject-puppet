# == Class: puppet::server
#
# This class manages the puppet server
#
# === Examples
#
#  class { 'puppet::server': }
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
class puppet::server(
  $enable  = true,
  $monitor = false,
  $options = {},
) {
  require common::client

  $defaults = {
    'ssl_client_header'        => 'SSL_CLIENT_S_DN',
    'ssl_client_verify_header' => 'SSL_CLIENT_VERIFY',
  }

  $options_real = merge($defaults, $options)

  include puppet::params::server
  include puppet::server::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
