class vmprovisioning {

	dsc_group {'vmprovisioningIUSRGroupAdd':
		dsc_groupname 						=> 'IIS_IUSRS',
		dsc_memberstoinclude 				=> 'icias\svc_vmprovision',
		dsc_ensure 							=> 'present',
	}

#	dsc_file {'VMProvisioning':
#		dsc_sourcepath 						=> '\\\\iciasdc1.icias.local\\ContentShare\\Managed\\Applications\\VMProvisioning',
#		dsc_destinationpath 				=> 'C:\inetpub\managed\VMProvisioning',
#		dsc_recurse 						=> true,
#		dsc_ensure 							=> present,
#		dsc_type 							=> directory,
#		dsc_matchsource 					=> true,
#	}

    iis_apppool {'VMProvisioningAppPool':
		ensure                          	=> 'present',
		name                            	=> 'VMProvisioning',
		enable32bitapponwin64       		=> false,
		managedpipelinemode 				=> 'Integrated',
		managedruntimeversion           	=> 'v4.0',
		processmodel_identitytype 			=> 'SpecificUser',
		processmodel_username 				=> $account,
		processmodel_password 				=> $pwd,
    }

	iis_app {'MainCollegeWebSite/VMProvisioning':
		ensure => 'present',
		physicalpath 						=> 'C:\\inetpub\\Managed\\Applications\\VMProvisioning',
		applicationpool 					=> 'VMProvisioning',
		enabledprotocols 					=> 'http',
	}

	exec { 'virtualDirectoryDefaultsuserName':
		command   							=> '$(import-module WebAdministration;Set-ItemProperty -Path "IIS:\Sites\MainCollegeWebSite\VMProvisioning" -Name "userName" -Value "")',
		logoutput 							=> true,
		provider  							=> powershell,
	}

	exec { 'virtualDirectoryDefaultspassword':
		command   							=> '$(import-module WebAdministration;Set-ItemProperty -Path "IIS:\Sites\MainCollegeWebSite\VMProvisioning" -Name "password" -Value "")',
		logoutput 							=> true,
		provider  							=> powershell,
	}
	;
	exec { 'check-anon-auth-vmprovisioning':
		command   							=> '$(Set-WebConfigurationProperty -filter /system.webServer/security/authentication/anonymousAuthentication -name enabled -Value $false -PSPath IIS:/Sites/MainCollegeWebSite/VMProvisioning)',
		logoutput 							=> true,
		provider  							=> powershell,
	}
	
	exec { 'check-windows-auth-vmprovisioning':
		command   							=> '$(Set-WebConfigurationProperty -filter /system.webServer/security/authentication/windowsAuthentication -name enabled -Value $true -PSPath IIS:/Sites/MainCollegeWebSite/VMProvisioning)',
		logoutput 							=> true,
		provider  							=> powershell,
	}
			
	exec { 'check-basic-auth-vmprovisioning':
		command   							=> '$(Set-WebConfigurationProperty -filter /system.webServer/security/authentication/basicAuthentication -name enabled -Value $true -PSPath IIS:/Sites/MainCollegeWebSite/VMProvisioning)',
		logoutput 							=> true,
		provider  							=> powershell,
	}
		
	exec { 'check-eventlogging-vmprovisioning':
		command   							=> '$(if ([System.Diagnostics.EventLog]::SourceExists("VMProvisonFrontEnd") -eq $false) {[System.Diagnostics.EventLog]::CreateEventSource("VMProvisonFrontEnd", "Application")})',
		logoutput 							=> true,
		provider  							=> powershell,
	}
}