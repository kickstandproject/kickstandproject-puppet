class puppet::server::service {
  service { $puppet::params::server::servicename:
    ensure      => $puppet::server::enable,
    enable      => $puppet::server::enable,
    hasrestart  => $puppet::params::server::hasrestart,
    hasstatus   => $puppet::params::server::hasstatus,
    require     => Class['puppet::server::config'],
    subscribe   => File[$puppet::params::server::configfile],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
