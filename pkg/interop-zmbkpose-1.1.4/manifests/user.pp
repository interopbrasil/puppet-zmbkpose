class zmbkpose::user {

        user { 'zimbra':
                ensure => 'present',
                gid => 'zimbra',
                require => Group['zimbra'],
        }

        group { 'zimbra':
                ensure => 'present',
        }



}
