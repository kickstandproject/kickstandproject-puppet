class puppet::server::config {
  include puppet::common::config

  common::function::concat::fragment { 'puppet.conf-server':
    target  => $puppet::params::server::configfile,
    content => template('puppet/etc/puppet/puppet.conf-server.erb'),
    order   => 02,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
