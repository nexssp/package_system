$nxsParameters = @("EnvPathAdd")
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssIn.ps1"

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/Env.ps1"

if (!$NexssStdout.EnvPathAdd) {
    nxsError("EnvPathAdd is required. Specify Path you wish to add to the system.") 
    exit
}

ensureEnvPath $NexssStdout.EnvPathAdd

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssOut.ps1"
