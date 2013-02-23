# == Class: puppet::client:init
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
class puppet::client::init {
  include puppet::client::install
  include puppet::client::config
  include puppet::client::service
}

# vim:sw=2:ts=2:expandtab
