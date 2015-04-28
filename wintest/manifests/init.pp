class wintest {

	# create a directory      
	file { 'C:\Temp':
		ensure => "directory",
	}

	# This is just a test file, you can change the text and puppet will fix it.
	 file { 'C:\Temp\hello.txt':	 
            require => File['C:\Temp'],	 
			content => "This is only a test\n"
		  }

	# I don't think this is needed and may remove it
	# exec {'executionpolicy':
	#	   command => '"Set-ExecutionPolicy Unrestricted -Force -Verbose"',
	#	   provider  => powershell,
	#	   logoutput => true,		 
	#		}
	 
	 exec {'chocolatey_Install':
		command   => "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))",
		provider => powershell,
		logoutput => true,
		creates => 'C:\ProgramData\chocolatey',
	} 
	 
	# Use chocolatey to install notepad++
	#  package { 'notepadplusplus':
	#  ensure   => installed,
	#  provider => 'chocolatey',
	#  require => Exec['chocolatey_Install'],
	#}
	
	 
	# Use chocolatey to install notepad++
	  package { 'NotepadPlus2':
	  ensure   => latest,
	  provider => 'chocolatey',
	  require => Exec['chocolatey_Install'],
	#  source => 'http://192.168.1.66/chocolatey'
	 source => 'http://denfamebld:8081/nexus/service/local/nuget/VersioIP/'
	}
	
	 
	
	#file { "C:/Temp/npp_6_7_Installer.exe":	
     
		
		 
	#	 source_permissions => ignore,
		 
	#		source => "puppet:///modules/wintest/npp_6_7_Installer.exe",
    #        notify => Package["npp"],
    #     }
		 
#		 acl { 'C:/Temp/npp_6_7_Installer.exe':
#  permissions => [
#   { identity => 'Administrator', rights => ['full'] },
#   { identity => 'Users', rights => ['read','execute'] }
# ],
#}
		 
#	package { "npp":
#            ensure => installed,
#            source => 'C:/Temp/npp_6_7_Installer.exe',
#            require => File["C:/Temp/npp_6_7_Installer.exe"],
#		    install_options => ['/S'],
#        }
} 