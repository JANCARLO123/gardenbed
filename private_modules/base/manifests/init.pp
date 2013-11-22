class base (
  $user_configs,
  $ssh_port = 22,
) {
  include base::firewall
  
  package { "vim":
    ensure => installed
  }
  
  class { 'base::ssh':
    ssh_port => $ssh_port
  }
  
  class { 'base::deployer':
    deployer_users => $user_configs["users"],
    ssh_keys       => $user_configs["ssh_keys"],
  }
  
  # from http://forge.puppetlabs.com/puppetlabs/apt
  class { 'apt':
    # always_apt_update    => false,
    # disable_keys         => undef,
    # proxy_host           => false,
    # proxy_port           => '8080',
    # purge_sources_list   => false,
    # purge_sources_list_d => false,
    # purge_preferences_d  => false,
    update_timeout       => undef
  }
}