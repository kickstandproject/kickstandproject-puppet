class puppet::server::init {
  include puppet::server::install
  include puppet::server::config

  if ($puppet::server::monitor) {
    include puppet::server::monitor
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
