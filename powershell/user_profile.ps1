# Set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Prompt
Import-Module posh-git
Import-Module oh-my-posh

# Load prompt config
$omp_config = Join-Path $PSScriptRoot ".\rocketshell.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
 
# Icons
Import-Module -Name Terminal-Icons

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Function "Touch" for powershell
function touch {
  Param (
    [Parameter(Mandatory=$true)]
    [string]$Path
  )

  if (Test-Path -LiteralPath $Path) {
    (Get-Item -Path $Path).LastWriteTime = Get-Date
  } else {
    New-Item -Type File -Path $Path
  }
}

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function d {
  cd 'D:\'
}

function c {
  cd 'C:\Users\SauloJustiniano\'
}

function dev-p {
  cd 'D:\development\projetos\'
}

function dev {
  cd 'D:\development\'
}

function q {
  cd ..
}

function mine {
  explorer "C:\Users\SauloJustiniano\Appdata\Roaming\.minecraft"
}

# Alias
Set-Alias -Name serv -Value Get-Service
Set-Alias -Name vim -Value nvim
Set-Alias -Name ll -Value ls
Set-Alias -Name cls -Value clear
Set-Alias -Name st -Value status
Set-Alias -Name g -Value git
Set-Alias -Name grep -Value findstr

Set-Alias np "C:\Windows\notepad.exe"
Set-Alias tig "C:\Program Files\Git\usr\bin\tig.exe"
Set-Alias less "C:\Program Files\Git\usr\bin\less.exe"

# PSReadLine
# Set-PSReadLineOption -EditMode Emacs
# Set-PSReadLineOption -BellStyle None
# Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
# Set-PSReadLineOption -PredictionSource History