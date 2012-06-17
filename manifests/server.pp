class puppet::server(
  $enable   = true,
  $monitor  = true,
  $options  = {},
) {
  require common::client

  $defaults = {
    'dbadapter'     => 'mysql',
    'dbname'        => 'puppet',
    'dbpassword'    => '',
    'dbserver'      => 'localhost',
    'dbuser'        => 'puppet',
    'storeconfigs'  => 'true',
  }

  $options_real = merge($defaults, $options)

  if (($options_real['storeconfigs'] == 'true') and ($options_real['dbpassword'] == '')) {
    fail('$options[\'dbpassword\'] paramater must not be empty.')
  }

  include puppet::params::server
  include puppet::server::init

  common::function::database { $puppet::params::server::packagename:
    password  => $options_real['dbpassword'],
    server    => $options_real['dbserver'],
    table     => $options_real['dbname'],
    type      => $options_real['dbadapter'],
    user      => $options_real['dbuser'],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
