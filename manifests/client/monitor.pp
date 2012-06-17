class puppet::client::monitor {
  monitor::function::process { $name:
    description => 'Puppet',
    process     => $puppet::params::client::processname,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
