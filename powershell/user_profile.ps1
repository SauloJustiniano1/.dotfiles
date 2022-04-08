# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
Import-Module posh-git
Import-Module oh-my-posh

# Load prompt config
$omp_config = Join-Path $PSScriptRoot ".\rocketshell.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
 
# Icons
Import-Module -Name Terminal-Icons

# Function Touch for powershell
function touch {
  Param(
    [Parameter(Mandatory=$true)]
    [string]$Path
  )

  if (Test-Path -LiteralPath $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  } else {
    New-Item -Type File -Path $Path
  }
}

# PSReadLine
# Set-PSReadLineOption -EditMode Emacs
# Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
# Set-PSReadLineOption -PredictionSource History

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias c clear
Set-Alias g git
Set-Alias grep findstr
Set-Alias np 'C:\Windows\notepad.exe'
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
