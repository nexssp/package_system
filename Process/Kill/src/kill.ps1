# Nexss PROGRAMMER 2.x - PowerShell
# System/Process/Kill
$nxsParameters = @("downloadPathCache", "downloadNocache", "downloadFast")
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssIn.ps1"

# This module has validation in the package _sure so we not doing it here..
if ($inFieldValue_1.count -eq 0) {
	nxsError("Pass at least one parameter Process ID or Process name.	")
	exit;
}

$exited = @()
$notFound = @()

$inFieldValue_1 | ForEach-Object -Process {
	if ($_ -match "^\d+$") {
		if (Get-Process -id $_ -ErrorAction SilentlyContinue) {
			Stop-Process -Id $_
			$exited += Get-Process | Where-Object { $_.HasExited }
		}
		else {
			$notFound += $_
		}
	}
	else {
		if (Get-Process $_ -ErrorAction SilentlyContinue) {
			$p = Get-Process -Name $_
			Stop-Process -InputObject $p
			$exited += Get-Process | Where-Object { $_.HasExited }
		}
		else {
			$notFound += $_
		}
	}
}

if ( $exited.count -gt 0 ) {
	$NexssStdout | Add-Member -Force -NotePropertyMembers  @{"$resultField_1" = $exited }
}
else {
	$NexssStdout.PSObject.Properties.Remove($resultField_1)  
}

if ( $notFound.count -gt 0 ) {
	$NexssStdout | Add-Member -Force -NotePropertyMembers  @{"kill:notfound" = $notFound }
}

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssOut.ps1"
