define myhost($ip) {
	if $name != $hostname {
		host { $name:
		  ensure       => 'present',
		  ip           => $ip,
		}		
	}
}

myhost { 'puppet':
  ip => '192.168.33.10',
}

myhost { 'agent':
  ip => '192.168.33.11',
}

