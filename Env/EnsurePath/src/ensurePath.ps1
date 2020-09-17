$nxsParameters = @("EnvPathAdd")
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssIn.ps1"

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/Env.ps1"

if (!$inFieldValue_1) {
    $errorMessage = "Parameter is required. Specify Path you wish to add to the system."
    nxsError($errorMessage) 
    $NexssStdout | Add-Member -Force -NotePropertyMembers  @{"nxsStop" = $TRUE }
    $NexssStdout | Add-Member -Force -NotePropertyMembers  @{"nxsStopReason" = $errorMessage }
}

ensureEnvPath $inFieldValue_1[0]

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssOut.ps1"
