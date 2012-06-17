class puppet::server::monitor {
  monitor::function::process { $name:
    process => $puppet::params::sever::processname,
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
