
shtops.ps1 $(Get-Content "~/.aliases") | out-string | Invoke-Expression

set-alias -name "npp" -value "$Env:Programfiles\Notepad++\notepad++.exe"
set-alias -name "grep" -Value "FindStr"
set-alias -name "which" -value "Get-Command"

$EDITOR="nvim"
$POSH_THEMES_PATH="$HOME/.poshthemes"
$POSH_THEME="$POSH_THEMES_PATH/ldev2.json"

function explore(){
	explorer .
}


Set-PSReadLineOption -Colors @{ Command = 'yellow' }
oh-my-posh init pwsh --config $POSH_THEME | Invoke-Expression


