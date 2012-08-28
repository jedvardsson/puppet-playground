class my_apache {
  case $operatingsystem {
    ubuntu: { $apache = "apache2" }
    default: { fail("Unrecognized operating system for webserver") }
  }

  package { $apache: 
    ensure => latest,
  }

  service { $apache:
    ensure  => running,
    require => Package[$apache],
  }
  file {'index.html':
    path    => '/var/www/index.html',
    ensure  => file,
    require => Package[$apache],
    source  => 'puppet:///modules/my_apache/index.html'
  }
}


