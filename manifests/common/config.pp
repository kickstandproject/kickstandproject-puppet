class puppet::common::config {
  File {
    group => $puppet::params::group,
    mode  => $puppet::params::mode,
    owner => $puppet::params::owner,
  }

  file { $puppet::params::basedir:
    ensure  => directory,
    force   => true,
    purge   => true,
    recurse => true,
  }

  common::function::concat { $puppet::params::configfile: }

  common::function::concat::fragment { 'puppet.conf-header':
    target  => $puppet::params::configfile,
    content => template('puppet/etc/puppet/puppet.conf-header.erb'),
    order   => 01,
  }

  file { [
    "${puppet::params::basedir}/manifests",
    "${puppet::params::basedir}/modules",
    "${puppet::params::basedir}/templates",
  ]:
    ensure  => directory,
    require => File[$puppet::params::basedir],
  }
}

# vim:sw=2:ts=2:expandtab:textwidth=79
