package { ['build-essential', 
	'xfslibs-dev',
	'zlib1g-dev',
	'libglib2.0-dev',
	'libpixman-1-dev',
	'libfdt-dev',
	'libsdl1.2-dev',
	'libsdl2-dev', 
	'libpcap-dev',
	'libaio-dev']:
	
	ensure => "installed",
}

package { ['emacs24',
	'git',
	'curl',
	'screen',
	'parallel',
	'vim']:

ensure => "installed",
}


package { ['gv',
	'eog']:

ensure => "installed",
}


package { ['xfsprogs',
	'xfsdump']:

ensure => "installed",
}
