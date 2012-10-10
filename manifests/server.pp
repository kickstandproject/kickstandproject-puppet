class puppet::server(
  $enable   = true,
  $monitor  = false,
  $options  = {},
) {
  require common::client

  $defaults = {
    'ssl_client_header'         => 'SSL_CLIENT_S_DN',
    'ssl_client_verify_header'  => 'SSL_CLIENT_VERIFY',
  }

  $options_real = merge($defaults, $options)

  include puppet::params::server
  include puppet::server::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
