class iisservers(){

#	reboot{'dsc_reboot':
#		when    => pending,
#		timeout => 15,
#		}
  
	exec { 'install-chocolatey':
		command			=> "iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex",
		provider 		=> powershell,
		}
  
#	exec { 'install-wmf5':
#		command 		=> "choco install powershell -y",
#		provider 		=> powershell,
#		}

	exec { 'chocolatey_install ':
		command 		=> "choco install notepadplusplus.install googlechrome 7zip.install sysinternals filezilla putty -y",
		provider 		=> powershell,
		}

	dsc_windowsfeature {'Web-App-Dev_Feature':	
		dsc_name		=> 'Web-App-Dev',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-ASP_Feature':	
		dsc_name 		=> 'Web-ASP',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Asp-Net_Feature':	
		dsc_name 		=> 'Web-Asp-Net',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Asp-Net45_Feature  # ASP.NET 4.5':	
		dsc_name 		=> 'Web-Asp-Net45',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Basic-Auth_Feature  # Basic Authentication':	
		dsc_name 		=> 'Web-Basic-Auth',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Cert-Auth_Feature  # IIS Client Certificate Mapping Authentication':	
		dsc_name 		=> 'Web-Cert-Auth',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-CGI_Feature  # CGI':	
		dsc_name 		=> 'Web-CGI',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Client-Auth_Feature  # Client Certificate Mapping Authentication':	
		dsc_name 		=> 'Web-Client-Auth',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Common-Http_Feature  # Common HTTP Features':	
		dsc_name 		=> 'Web-Common-Http',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Custom-Logging_Feature  # Custom Logging':	
		dsc_name 		=> 'Web-Custom-Logging',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Default-Doc_Feature  # Default Document':	
		dsc_name 		=> 'Web-Default-Doc',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Digest-Auth_Feature  # Digest Authentication':	
		dsc_name 		=> 'Web-Digest-Auth',
		dsc_ensure		=> 'Present',
	}

	dsc_windowsfeature {'Web-Dir-Browsing_Feature  # Directory Browsing':	
		dsc_name 		=> 'Web-Dir-Browsing',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Dyn-Compression_Feature  # Dynamic Content Compression':	
		dsc_name 		=> 'Web-Dyn-Compression',
		dsc_ensure		=> 'Present',
	}

	dsc_windowsfeature {'Web-Filtering_Feature  # Request Filtering':	
		dsc_name 		=> 'Web-Filtering',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Health_Feature  # Health and Diagnostics':	
		dsc_name 		=> 'Web-Health',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Http-Errors_Feature  # HTTP Errors':	
		dsc_name 		=> 'Web-Http-Errors',
		dsc_ensure 		=> 'Present',
	}

	dsc_windowsfeature {'Web-Http-Logging_Feature  # HTTP Logging':	
		dsc_name => 'Web-Http-Logging',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Http-Redirect_Feature  # HTTP Redirection':	
		dsc_name => 'Web-Http-Redirect',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Http-Tracing_Feature  # Tracing':	
		dsc_name => 'Web-Http-Tracing',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Includes_Feature  # Server Side Includes':	
		dsc_name => 'Web-Includes',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-IP-Security_Feature  # IP and Domain Restrictions':	
		dsc_name => 'Web-IP-Security',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-ISAPI-Ext_Feature  # ISAPI Extensions':	
		dsc_name => 'Web-ISAPI-Ext',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-ISAPI-Filter_Feature  # ISAPI Filters':	
		dsc_name => 'Web-ISAPI-Filter',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Lgcy-Mgmt-Console_Feature  # IIS 6 Management Console':	
		dsc_name => 'Web-Lgcy-Mgmt-Console',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Lgcy-Scripting_Feature  # IIS 6 Scripting Tools':	
		dsc_name => 'Web-Lgcy-Scripting',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Log-Libraries_Feature  # Logging Tools':	
		dsc_name => 'Web-Log-Libraries',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Metabase_Feature  # IIS 6 Metabase Compatibility':	
		dsc_name => 'Web-Metabase',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Mgmt-Compat_Feature  # IIS 6 Management Compatibility':	
		dsc_name => 'Web-Mgmt-Compat',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Mgmt-Console_Feature  # IIS Management Console':	
		dsc_name => 'Web-Mgmt-Console',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Mgmt-Service_Feature  # Management Service':	
		dsc_name => 'Web-Mgmt-Service',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Mgmt-Tools_Feature  # Management Tools':	
		dsc_name => 'Web-Mgmt-Tools',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Net-Ext_Feature  # .NET Extensibility 3.5':	
		dsc_name => 'Web-Net-Ext',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Net-Ext45_Feature  # .NET Extensibility 4.5':	
		dsc_name => 'Web-Net-Ext45',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Performance_Feature  # Performance':	
		dsc_name => 'Web-Performance',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Request-Monitor_Feature  # Request Monitor':	
		dsc_name => 'Web-Request-Monitor',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Scripting-Tools_Feature  # IIS Management Scripts and Tools':	
		dsc_name => 'Web-Scripting-Tools',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Security_Feature  # Security':	
		dsc_name => 'Web-Security',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Server_Feature  # Web Server (IIS)':	
		dsc_name => 'Web-Server',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Stat-Compression_Feature  # Static Content Compression':	
		dsc_name => 'Web-Stat-Compression',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Static-Content_Feature  # Static Content':	
		dsc_name => 'Web-Static-Content',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Url-Auth_Feature  # URL Authorization':	
		dsc_name => 'Web-Url-Auth',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-WebServer_Feature  # Web Server':	
		dsc_name => 'Web-WebServer',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-Windows-Auth_Feature  # Windows Authentication':	
		dsc_name => 'Web-Windows-Auth',
		dsc_ensure => 'Present',
	}

	dsc_windowsfeature {'Web-WMI_Feature  # IIS 6 WMI Compatibility':	
		dsc_name => 'Web-WMI',
		dsc_ensure => 'Present',
	}
	
	dsc_file {'IISLogDir':
		dsc_ensure => present,
		dsc_type => directory,
		dsc_destinationpath => 'C:\IISLogs',
	}
	
	dsc_file {'IISFailedRequestLogDir':
		dsc_ensure => present,
		dsc_type => directory,
		dsc_destinationpath => 'C:\IISFailedRequestLogs',
	}
	
	dsc_file {'installers':
		dsc_sourcepath => '\\\\iciasdc1\\ContentShare\\installers',
		dsc_destinationpath => 'C:\installers',
		dsc_recurse => true,
		dsc_ensure => present,
		dsc_type => directory,
		dsc_matchsource => true,
	}
	
	dsc_file {'phpmodule':
		dsc_sourcepath => '\\\\iciasdc1\\ContentShare\\phpmodule',
		dsc_destinationpath => 'C:\inetpub\phpmodule',
		dsc_recurse => true,
		dsc_ensure => present,
		dsc_type => directory,
		dsc_matchsource => true,
	}

	dsc_package { 'IIS URL Rewrite Module 2':
		dsc_ensure => 'present',
		dsc_version => '7.2.1952',
		dsc_path => 'c:\installers\rewrite_amd64.msi',
		dsc_name => 'IIS URL Rewrite Module 2',
		dsc_productid => '08F0318A-D113-4CF0-993E-50F191D397AD',
	} 
	
	dsc_package { 'PHP Manager 1.3 for IIS 8-8.5':
		dsc_ensure => 'present',
		dsc_version => '1.3.0',
		dsc_path => 'c:\installers\PHPManagerForIIS-1.3.0-x64-IIS8.msi',
		dsc_name => 'PHP Manager 1.3 for IIS 8-8.5',
		dsc_productid => 'E851486F-1FE2-44F0-85ED-F969088A68EE',
	}

	package { "Microsoft Visual C++ 2012 Redistributable (x64) - 11.0.61030":
		ensure		 		=> '11.0.61030.0',
		provider 			=> 'windows',
		source	 			=> 'c:/installers/vcredist_x64.exe',
		install_options		=> '/q',
	}
	
	package { "Microsoft Visual C++ 2010 x64 Redistributable - 10.0.30319":
		ensure => '10.0.30319',
		provider => 'windows',
		source => 'C:/Installers/vcredist_x64_2010.exe',
		install_options => '/q',
	}
	
	package { "Microsoft Visual C++ 2013 Redistributable (x64) - 12.0.21005":
		ensure => '12.0.21005.1',
		provider => windows,
		source => 'C:/Installers/vcredist_x64_2013.exe',
		install_options => '/passive',
	}
	
	package { "Microsoft Visual C++ 2012 Redistributable (x86) - 11.0.61030":
		ensure => '11.0.61030.0',
		provider => 'windows',
		source => 'C:/Installers/vcredist_x86.exe',
		install_options => '/passive',
	}
	
	package { "Microsoft Visual C++ 2010 x86 Redistributable - 10.0.30319":
		ensure => '10.0.30319',
		provider => 'windows',
		source => 'C:/Installers/vcredist_x86_2010.exe',
		install_options => '/q',
	}
	
	package { "Microsoft Visual C++ 2013 Redistributable (x86) - 12.0.21005":
		ensure => '12.0.21005.1',
		provider => 'windows',
		source => 'C:/Installers/vcredist_x86_2013.exe',
		install_options => '/passive',
	}

	exec { 'check-windows-auth-delegation':
			command   => 'Set-WebConfiguration //System.WebServer/Security/Authentication/windowsAuthentication -metadata overrideMode -value Allow -PSPath IIS:/',
			onlyif    => 'if ((get-WebConfiguration //System.WebServer/Security/Authentication/windowsAuthentication).overridemode -ne \'Allow\') { exit 0 }',
			provider  => powershell,
			}
			
	exec { 'check-anon-auth-delegation':
			command   => 'Set-WebConfiguration //System.WebServer/Security/Authentication/AnonymousAuthentication -metadata overrideMode -value Allow -PSPath IIS:/',
			onlyif    => 'if ((get-WebConfiguration //System.WebServer/Security/Authentication/AnonymousAuthentication).overridemode -ne \'Allow\') { exit 0 }',
			provider  => powershell,
			}
			
	exec { 'add-servername-to-reponse-header':
			command   => '$([System.Reflection.Assembly]::LoadWithPartialName("Microsoft.Web.Administration") | Out-Null;$iis = new-object Microsoft.Web.Administration.ServerManager;$config = $iis.GetApplicationHostConfiguration();$httpProtocolSection = $config.GetSection("system.webServer/httpProtocol");$customHeadersCollection = $httpProtocolSection.GetCollection("customHeaders");$addElement = $customHeadersCollection.CreateElement("add");$addElement["name"] = "X-Web-Server";$addElement["value"] = "$env:computername";$customHeadersCollection.Add($addElement);$iis.CommitChanges();)',
			onlyif    => 'if ((Get-WebConfiguration "/system.webServer/httpProtocol/customHeaders/add[@name="X-Web-Server"]") -eq $null) {exit 0} else {exit 10}) { exit 0 }',
			logoutput => true,
			provider  => powershell,
			}
			
	dsc_xwebsitedefaults {'webserverdefaults':
		dsc_applyto => "Machine",
		dsc_logdirectory => "C:\IISLogs",
		dsc_tracelogdirectory => "C:\IISFailedRequestLogs",
	}
}
