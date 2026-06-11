# Java detection script that checks for a registry key

param(
    [string]$regPath = "HKLM:\SOFTWARE\JavaSoft\Java Runtime Environment",  # Path to Java registry key
    [string]$regValue = "CurrentVersion"                                    # The value name to check
)

# Log path for Intune troubleshooting
$logPath = "$env:ProgramData\WingetJavaDetection.log"

# Ensure log directory exists
if (-not (Test-Path (Split-Path $logPath))) {
    New-Item -ItemType Directory -Path (Split-Path $logPath) -Force
}

# Function to write log entries
function Write-Log {
    param ($message)
    $timeStamp = Get-Date -format "MM-dd-yyyy HH:mm:ss"
    "$timeStamp - $message" | Out-File -FilePath $logPath -Append
}

Write-Log "Starting Java detection via registry check"

try {
    # Check if registry key exists
    if (Test-Path $regPath) {
        Write-Log "Registry path found: $regPath"

        # Check if the registry value exists
        $regValueExist = Get-ItemProperty -Path $regPath -Name $regValue -ErrorAction SilentlyContinue

        if ($regValueExist) {
            Write-Log "Registry value '$regValue' found. Java is installed."
            exit 0  # Success (Java is installed)
        } else {
            Write-Log "Registry value '$regValue' not found. Java is not installed."
            exit 1  # Failure (Java is not installed)
        }
    } else {
        Write-Log "Registry path not found: $regPath"
        exit 1  # Failure (Java is not installed)
    }
}
catch {
    Write-Log "An error occurred while checking registry: $_"
    exit 1  # Failure
}
