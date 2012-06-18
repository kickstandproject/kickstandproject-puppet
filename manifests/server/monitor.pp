class puppet::server::monitor {
  monitor::function::process { $name:
    description => 'Puppet Master',
    process     => $puppet::params::server::processname,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
