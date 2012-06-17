class puppet::client::service {
  service { $puppet::params::client::servicename:
    ensure      => $puppet::client::enable,
    enable      => $puppet::client::enable,
    hasrestart  => $puppet::params::client::hasrestart,
    hasstatus   => $puppet::params::client::hasstatus,
    require     => Class['puppet::client::config'],
    subscribe   => File[$puppet::params::client::configfile],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
