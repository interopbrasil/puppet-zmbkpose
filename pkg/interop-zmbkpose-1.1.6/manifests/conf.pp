class zmbkpose::conf {
  file { "$::zmbkpose::confzmbkpose":
    ensure  => 'file',
    content => template('zmbkpose/zmbkpose.conf.erb'),
  }

  file { "$::zmbkpose::binzmbkpose":
    ensure  => 'file',
    mode    => '0755',
    content => template('zmbkpose/zmbkpose.erb'),
  }

}
