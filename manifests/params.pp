class zmbkpose::params {
  $dirconf = '/etc/zmbkpose'
  $binzmbkpose = '/usr/local/bin/zmbkpose'
  $confzmbkpose = "${dirconf}/zmbkpose.conf"

  # Configurações do zmbkpose.conf
  $backupuser = 'zimbra'
  $workdir = '/opt/backup'
  $dirlog = "${workdir}/log"
  $logfile = "${dirlog}/backup.log"
  $adminuser = 'admin'
  $adminpass = 'senhadoadmin'
  $ldapmasterserver = $::ipaddress
  $ldapzimbradn = 'uid=zimbra,cn=admins,cn=zimbra'
  $ldapzimbrapass = $::ldap_root_password
  $email_notify = 'suporte@dominio.com'
  $parallel_support = '1'
  $max_parallel_process = '3'
  $removeBackupDias = '15'

  # Cron
  $backupFull = {
    'min'      => '3',
    'hora'     => '2',
    'monthday' => '1',
    'month'    => '2',
    'weekday'  => '2'
  }
  $backupIncr = {
    'min'      => '3',
    'hora'     => '2',
    'monthday' => '1',
    'month'    => '2',
    'weekday'  => '2'
  }
  $backupRemove = {
    'min'      => '3',
    'hora'     => '2',
    'monthday' => '1',
    'month'    => '2',
    'weekday'  => '2'
  }

  # Different path and package definitions
  case $::operatingsystem {
    'CentOS' : {
      case $::operatingsystemmajrelease {
        '7' : {
          $crondir = '/etc/cron.d'
          $cronconf = "${crondir}/zimbra"
        }
      }
    }
    default  : {
      $exports_file = undef
      $idmapd_file = undef
      $defaults_file = undef
      $server_packages = undef
      $client_packages = undef
      notice("\"${module_name}\" provides no config directory and package default values for OS family \"${::osfamily}\"")
    }
  }

}

