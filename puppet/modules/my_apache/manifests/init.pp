class my_apache {
  case $operatingsystem {
    centos: { $apache = "httpd" }
    ubuntu: { $apache = "apache2" }
    default: { fail("Unrecognized operating system for webserver") }
  }

  package { 'apache2': 
    ensure => latest,
  }

  service { 'apache2':
    ensure  => running,
    require => Package[$apache],
  }
#  file {'httpd.conf':
#    path    => '/etc/httpd/conf/httpd.conf',
#    ensure  => file,
#    require => Package[$apache],
#    source  => 'puppet:///modules/apache/httpd.conf',
#  }
  file {'index.html':
    path    => '/var/www/index.html',
    ensure  => file,
    require => Package[$apache],
    source  => 'puppet:///modules/apache/index.html'
  }
}


