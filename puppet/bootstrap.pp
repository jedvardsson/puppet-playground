define myhost($ip) {
  if $name != $::hostname {
    host { $name:
      ensure       => 'present',
      ip           => $ip,
    }   
  }
}

myhost { 'puppet':
  ip => '192.168.33.10',
}

myhost { 'node1':
  ip => '192.168.33.11',
}


node 'puppet' {
  package {'puppetmaster':
    ensure => latest,
  }
  service { 'puppetmaster':
    ensure  => running,
    require => Package['puppetmaster'],
  }
}

node 'node1' {
  package { 'puppet':
    ensure => latest,      
  }
  service { 'puppet':
    ensure  => stopped,
    require => Package['puppet'],
  }
}