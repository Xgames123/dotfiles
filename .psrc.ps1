
shtops.ps1 $(Get-Content "~/.aliases") | out-string | Invoke-Expression

set-alias -name "npp" -value "$Env:Programfiles\Notepad++\notepad++.exe"
set-alias -name "grep" -Value "FindStr"
set-alias -name "which" -value "Get-Command"

function explore(){
	explorer .
}

$EDITOR="npp"


Set-PSReadLineOption -Colors @{ Command = 'blue' }
oh-my-posh init pwsh --config $HOME/.poshthemes/ldev.json | Invoke-Expression


