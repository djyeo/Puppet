class mcws {

	#dsc_group {'IUSRGroupAdd':
	#	dsc_groupname 								=> 'IIS_IUSRS',
	#	dsc_memberstoinclude 						=> 'icias\\svc_iisapppool',
	#	dsc_ensure 									=> 'present',
		
	#dsc_credential								=> '??????',
	
	#}

	 iis_site {'Default Web Site':
		name   										=> 'Default Web Site',
        ensure 										=> 'absent',
      }

    iis_apppool {'MainCollegeWebSite':
		ensure                            			=> 'present',
		name                              			=> 'MainCollegeWebSite',
		enable32bitapponwin64       				=> false,
		managedpipelinemode 						=> 'Integrated',
		managedruntimeversion             			=> 'v4.0',
    }

    iis_site {'MainCollegeWebSite':
        ensure                              		=> 'present',
        name                           				=> 'MainCollegeWebSite',
        physicalpath								=> '\\\\iciasdc1\contentshare\\Managed\\Applications\\MainCollegeWebSite',
		bindings     								=> ["http/*:80:","http/*:80:www.imperial.ac.uk"],
        applicationdefaults_applicationpool 		=> 'MainCollegeWebSite',
		virtualdirectorydefaults_allowsubdirconfig  => true,
    }

	exec { 'SetvirtualDirectoryDefaultsuserName':
		command   									=> '$(import-module WebAdministration;Set-ItemProperty -Path "IIS:\Sites\MainCollegeWebSite" -Name "userName" -Value "icias\svc_apppool")',
		logoutput 									=> true,
		provider  									=> powershell,
	}

	exec { 'SetvirtualDirectoryDefaultspassword':
		command   									=> '$(import-module WebAdministration;Set-ItemProperty -Path "IIS:\Sites\MainCollegeWebSite" -Name "password" -Value "1QAZ2wsx3edc")',
		logoutput 									=> true,
		provider  									=> powershell,
	}

	iis_vdir { 'MainCollegeWebSite/2007templates':
		ensure       								=> present,
		iis_app      								=> 'MainCollegeWebSite/',
		physicalpath 								=> '\\\\iciasdc1\contentshare\\Shared\\2007templates',
	}
	
	iis_vdir { 'MainCollegeWebSite/css':
		ensure       								=> present,
		iis_app      								=> 'MainCollegeWebSite/',
		physicalpath 								=> '\\\\iciasdc1\contentshare\\Shared\\css',
	}
	
	iis_vdir { 'MainCollegeWebSite/javascript':
		ensure       								=> present,
		iis_app      								=> 'MainCollegeWebSite/',
		physicalpath 								=> '\\\\iciasdc1\contentshare\\Shared\\javascript',
	}
	
	iis_vdir { 'MainCollegeWebSite/ssi':
		ensure       								=> present,
		iis_app      								=> 'MainCollegeWebSite/',
		physicalpath 								=> '\\\\iciasdc1\contentshare\\Shared\\ssi',
	}
	
	iis_vdir { 'MainCollegeWebSite/T4Assets':
		ensure       								=> present,
		iis_app      								=> 'MainCollegeWebSite/',
		physicalpath 								=> '\\\\iciasdc1\contentshare\\Shared\\T4Assets',
	}

	exec { 'add-php-for-maincollegewebsite':
		command   									=> '$(Add-PsSnapin PHPManagerSnapin;Import-Module WebAdministration;New-PHPVersion -SiteName "MainCollegeWebSite" -ScriptProcessor "C:\inetpub\phpmodule\5.6.22-T4\php-cgi.exe" -Verbose)',
		onlyif    									=> 'if (Add-PsSnapin PHPManagerSnapin;Import-Module WebAdministration;$version = Get-PHPVersion -SiteName "MainCollegeWebSite";if ($version.Version -eq "5.6.22") {write-host "all good!";exit 0} else {write-host "all bad!";exit10};) { exit 10 }',
		logoutput 									=> true,
		provider  									=> powershell,
	}
}