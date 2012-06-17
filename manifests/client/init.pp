class puppet::client::init {
  include puppet::client::install
  include puppet::client::config
  include puppet::client::service

  if ($puppet::client::monitor) {
    include puppet::client::monitor
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
