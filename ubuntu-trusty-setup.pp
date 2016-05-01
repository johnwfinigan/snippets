package { ['build-essential', 
	'xfslibs-dev',
	'zlib1g-dev',
	'libglib2.0-dev',
	'libpixman-1-dev',
	'libfdt-dev',
	'libsdl1.2-dev',
	'libsdl2-dev']:
	
	ensure => "installed",
}

package { ['emacs24',
	'git',
	'curl',
	'parallel',
	'vim']:

ensure => "installed",
}

