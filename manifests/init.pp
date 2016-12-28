# == Class: zmbkpose
#
# Full description of class zmbkpose here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { zmbkpose:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class zmbkpose (
  $dirconf              = $::zmbkpose::params::dirconf,
  $workdir              = $::zmbkpose::params::workdir,
  $dirlog               = $::zmbkpose::params::dirlog,
  $crondir              = $::zmbkpose::params::crondir,
  $cronconf             = $::zmbkpose::params::cronconf,
  $useradmin            = $::zmbkpose::params::useradmin,
  $pwdadmin             = $::zmbkpose::params::pwdadmin,
  $binzmbkpose          = $::zmbkpose::params::binzmbkpose,
  $confzmbkpose         = $::zmbkpose::params::confzmbkpose,
  $adminuser            = $::zmbkpose::params::adminuser,
  $adminpass            = $::zmbkpose::params::adminpass,
  $ldapmasterserver     = $::zmbkpose::params::ldapmasterserver,
  $ldapzimbradn         = $::zmbkpose::params::ldapzimbradn,
  $ldapzimbrapass       = $::zmbkpose::params::ldapzimbrapass,
  $email_notify         = $::zmbkpose::params::email_notify,
  $parallel_support     = $::zmbkpose::params::parallel_support,
  $max_parallel_process = $::zmbkpose::params::max_parallel_process,
  $removeBackupDias     = $::zmbkpose::params::removeBackupDias,
  # Cron
  $backupFull           = $::zmbkpose::params::backupFull,
  $backupIncr           = $::zmbkpose::params::backupIncr,
  $backupRemove         = $::zmbkpose::params::backupRemove,) inherits zmbkpose::params {
  class { 'zmbkpose::user': } ->
  class { 'zmbkpose::dir': } ->
  class { 'zmbkpose::conf': } ->
  class { 'zmbkpose::cron': }

}
