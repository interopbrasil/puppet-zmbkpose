class zmbkpose::cron {
  file { '/opt/zimbra/conf/crontabs/crontab.zmbkpose':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    content => template('zmbkpose/cron.erb'),
  }

  service { 'crond':
    ensure     => 'running',
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
  }

  cron { 'BackupFull-zmbkpose':
    command  => "$::zmbkpose::params::binzmbkpose -f",
    user     => 'zimbra',
    hour     => $::zmbkpose::params::backupFull['hora'],
    minute   => $::zmbkpose::params::backupFull['min'],
    month    => $::zmbkpose::params::backupFull['month'],
    monthday => $::zmbkpose::params::backupFull['monthday'],
    weekday  => $::zmbkpose::params::backupFull['weekday'],
    notify   => Service['crond'],
  }

  cron { 'BackupIncremental-zmbkpose':
    command  => "$::zmbkpose::params::binzmbkpose -i",
    user     => 'zimbra',
    hour     => $::zmbkpose::params::backupIncr['hora'],
    minute   => $::zmbkpose::params::backupIncr['min'],
    month    => $::zmbkpose::params::backupIncr['month'],
    monthday => $::zmbkpose::params::backupIncr['monthday'],
    weekday  => $::zmbkpose::params::backupIncr['weekday'],
    notify   => Service['crond'],
  }

  cron { 'BackupRemove-zmbkpose':
    command  => "$::zmbkpose::params::binzmbkpose -d $::zmbkpose::removeBackupDias",
    user     => 'zimbra',
    hour     => $::zmbkpose::params::backupRemove['hora'],
    minute   => $::zmbkpose::params::backupRemove['min'],
    month    => $::zmbkpose::params::backupRemove['month'],
    monthday => $::zmbkpose::params::backupRemove['monthday'],
    weekday  => $::zmbkpose::params::backupRemove['weekday'],
    notify   => Service['crond'],
  }

}
