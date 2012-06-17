class puppet::params::client inherits puppet::params {
  $defaultsfile = $::operatingsystem ? {
    default => '/etc/default/puppet',
  }

  $hasrestart = $::operatingsystem ? {
    default => true,
  }

  $hasstatus = $::operatingsystem ? {
    default => true,
  }

  $packagename = $::operatingsystem ? {
    default => 'puppet',
  }

  $processname = $::operatingsystem ? {
    default => 'puppet -a agent',
  }

  $servicename = $::operatingsystem ? {
    default => 'puppet',
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
