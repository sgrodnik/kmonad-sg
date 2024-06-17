param (
    [switch]$Stop
)

$processName = "kmonad"
$exePath = "$env:APPDATA\kmonad\kmonad.exe"
$configPath = "$env:APPDATA\kmonad\kmonad-sg.kbd"

$process = Get-Process -Name $processName -ErrorAction SilentlyContinue
if ($process) {
    $process | Stop-Process -Force
}

if (-not $Stop) {
    Start-Process -FilePath $exePath -ArgumentList $configPath -WindowStyle Hidden
}
