class puppet::server(
  $enable   = true,
  $monitor  = false,
  $options  = {},
) {
  include puppet::params::server
  include puppet::server::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
