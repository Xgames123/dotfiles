# Use --help for help
$ErrorActionPreference = "Stop"

if($args -contains "--help"){
	echo "Usage: win-install [--uninstall] [--help]"
	exit 0
}

$profile=$PROFILE.CurrentUserAllHosts
if (Test-Path -Path "$profile" -PathType Leaf){
	echo "Making backup of $profile"
	
	mkdir -Force $HOME/.dotfiles-old/PsProfiles/
	cp -Force $profile $HOME/.dotfiles-old/PsProfiles/

	echo "Backup made at $HOME/.dotfiles-old"

	$awnser = Read-Host "Did backup work? (yN) "
	if ($awnser -ne "y"){
		exit -1
	}
	
	echo "Overwriting file..."
}


echo ". ~/.psrc.ps1" > $profile

echo "Done"