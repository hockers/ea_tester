$processes = Get-Process "*docker desktop*"
# ForEach ($proc in $processes) {
#     $proc.Kill()
#     $proc.WaitForExit()
# }
Stop-Process $processes
Restart-Service LxssManager -Verbose
restart-service *docker*

Start-Sleep 5
Start-Process "C:\Program Files\Docker\Docker\Docker Desktop.exe"