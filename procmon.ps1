$procname="chrome"
$intervall=10

while($true)
{
	$timestamp = Get-Date
	$proclist = Get-Process | ? { $_.ProcessName -Contains $procname }
	$datalist = $proclist | % { $_ | Add-Member @{Timestamp=$timestamp} -PassThru }
	$datalist | Select Timestamp,ID,ProcessName,CPU,WS | Export-Csv -Append -Path "$($procname).log"
	Start-Sleep 10
}
