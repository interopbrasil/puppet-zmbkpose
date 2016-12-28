Facter.add('ldap_root_password') do
  setcode do
    Facter::Core::Execution.exec('/opt/zimbra/bin/zmlocalconfig -s ldap_root_password | awk \'{ print $3 }\'')
  end
end
