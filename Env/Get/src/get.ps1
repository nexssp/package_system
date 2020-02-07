$nxsParameters = @("EnvPathAdd")
$input | . "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssIn.ps1"

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/Env.ps1"

if (!$inFieldValue_1) {
    nxsError("Parameter is required. Specify which environment variables you wish to get. Specify multiple parameters") 
    exit
}

function Get-Envs {
    process {
        $NexssStdout | Add-Member -Force -NotePropertyMembers  @{$_ = [Environment]::GetEnvironmentVariable($_) } 
    }
}

$inFieldValue_1 | Get-Envs

. "$($env:NEXSS_PACKAGES_PATH)/Nexss/Lib/NexssOut.ps1"
