class newsevents {

	dsc_file {'newsevents':
		dsc_sourcepath => '\\\\iciasdc1\\ContentShare\\newsevents',
		dsc_destinationpath => 'C:\inetpub\managed\newsevents',
		dsc_recurse => true,
		dsc_ensure => present,
		dsc_type => directory,
		dsc_matchsource => true,
	}
	
	dsc_file {'NewsEventsLogDir':
		dsc_ensure => present,
		dsc_type => directory,
		dsc_destinationpath => 'D:\Logs\NewsEvents',
	}
	
	acl { 'C:\\inetpub\\managed\\newsevents\\data':
	permissions => [
		{ identity => 'IUSR', rights => ['modify']}
	],
	}
	
		acl { 'D:\Logs\NewsEvents':
	permissions => [
		{ identity => 'IUSR', rights => ['modify']}
	],
	}

    iis_apppool {'NewsEventsAppPool':
    ensure                              => 'present',
	name                               => 'NewsEvents',
    enable32bitapponwin64       => false,
	managedpipelinemode 		=> 'Integrated',
    managedruntimeversion             => 'v4.0',
    }

	iis_app {'MainCollegeWebSite/NewsEvents':
	ensure => 'present',
	physicalpath => 'C:\\inetpub\\managed\\newsevents',
	applicationpool => 'NewsEvents',
	enabledprotocols => 'http',
	}

		exec { 'NESetvirtualDirectoryDefaultsuserName':
		command   									=> '$(import-module WebAdministration;Set-ItemProperty -Path "IIS:\Sites\MainCollegeWebSite\NewsEvents" -Name "userName" -Value "")',
		logoutput 									=> true,
		provider  									=> powershell,
	}

	exec { 'NESetvirtualDirectoryDefaultspassword':
		command   									=> '$(import-module WebAdministration;Set-ItemProperty -Path "IIS:\Sites\MainCollegeWebSite\NewsEvents" -Name "password" -Value "")',
		logoutput 									=> true,
		provider  									=> powershell,
	}
}