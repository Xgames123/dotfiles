# Use --help for help
$ErrorActionPreference = "Stop"

if($args -contains "--help"){
  echo "Usage: win-install [--help]"
	exit 0
}
 $elevated = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if ( -not $elevated) {
  echo "This script requires running as Administrator"
  exit -1
}
$rootdir=$(Get-Location)

echo "INFO:"
echo "Root directory: $rootdir"
echo ""
if ( -not (Test-Path -Path "$rootdir/.dotfiles/scripts/win-install.ps1" -PathType Leaf)){
	echo "FATAL: $rootdir/.dotfiles/scripts/win-install.ps1 doesn't exist"
	echo "Run the script from the root directory (.dotfiles/scripts/win-install.ps1)"
	echo "Aborting install"
	exit -1
}

$awnser = $(Read-Host "Is this ok (y/N) ")
if ($awnser -ne "y"){
	echo "Aborting install"
	exit -1
}

$profile=$PROFILE.CurrentUserAllHosts
mkdir "$profile" -ea 0
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

echo "Copying .dotfiles/win"
$files=Get-ChildItem "$rootdir/.dotfiles/win"
for ($i=0; $i -lt $files.Count; $i++){
  $name = $files[$i].Name
  echo $name
  $dest="null"
  if ($name -eq "Program Files (noroot)"){
    $dest="$Env:Programfiles/../Program Files (noroot)"
  }
  if ($name -eq "AppDataLocal"){
    $dest="$Env:LOCALAPPDATA"
  }
  if ($dest -ne "null"){
    robocopy $files[$i].FullName $dest /E
  }
}

echo ". ~/.psrc.ps1" > $profile

echo "Done"
