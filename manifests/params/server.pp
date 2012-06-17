class puppet::params::server inherits puppet::params {
  $defaultsfile = $::operatingsystem ? {
    default => '/etc/default/puppetmaster',
  }

  $hasrestart = $::operatingsystem ? {
    default => true,
  }

  $hasstatus = $::operatingsystem ? {
    default => true,
  }

  $packagename = $::operatingsystem ? {
    default => [
      'puppetmaster-passenger',
      'ruby-activerecord',
      'ruby-mysql'
    ],
  }

  $processname = $::operatingsystem ? {
    default => 'puppet -a master',
  }

  $servicename = $::operatingsystem ? {
    default => 'puppetmaster',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
