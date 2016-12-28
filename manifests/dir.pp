class zmbkpose::dir {
  $dirconf = $::zmbkpose::dirconf
  $workdir = $::zmbkpose::workdir
  $dirlog = $::zmbkpose::dirlog
  $crondir = $::zmbkpose::crondir

  file { "${dirconf}": ensure => 'directory', }

  file { "${workdir}":
    ensure => 'directory',
    owner  => 'zimbra',
    group  => 'zimbra',
    mode   => '0755',
    force  => true,
  }

  file { "${dirlog}":
    ensure  => 'directory',
    owner   => 'zimbra',
    group   => 'zimbra',
    mode    => '0754',
    require => File["${workdir}"],
  }

  file { "${crondir}": ensure => 'directory', }
}
