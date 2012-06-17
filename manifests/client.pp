class puppet::client(
  $enable   = true,
  $monitor  = true,
  $options  = {},
) {
  require common::client

  $defaults = {
    'pluginsync'        => 'true',
    'runinterval'       => '1800',
    'server'            => 'localhost',
    'usecacheonfailure' => 'false',
  }

  $options_real = merge($defaults, $options)

  include puppet::params::client
  include puppet::client::init
}

# vim:sw=2:ts=2:expandtab:textwidth=79
