$nxsParameters = @("EnvPathAdd")
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssIn.ps1"

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/Env.ps1"

if (!$inFieldValue_1) {
    nxsError("Parameter is required is required. Specify Path you wish to add to the system.") 
    exit
}
nxsInfo("Adding path $($inFieldValue_1) to the environment")
ensureEnvPath $inFieldValue_1[0]

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssOut.ps1"
