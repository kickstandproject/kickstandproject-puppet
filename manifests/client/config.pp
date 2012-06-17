class puppet::client::config {
  include puppet::common::config

  common::function::concat::fragment { 'puppet.conf-client':
    target  => $puppet::params::client::configfile,
    content => template('puppet/etc/puppet/puppet.conf-client.erb'),
    order   => 03,
  }

  file { $puppet::params::client::defaultsfile:
    ensure  => file,
    content => template('puppet/etc/default/puppet.erb'),
    notify  => Class['puppet::client::service'],
    require => Class['puppet::client::install'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
