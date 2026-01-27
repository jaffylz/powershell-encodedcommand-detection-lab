# PowerShell EncodedCommand – Detection Lab

## Step 4 – Detection
- Sysmon Event ID 1 detected
- powershell.exe executed with -EncodedCommand

## Step 5 – Analysis
- EncodedCommand observed in process.command_line
- Parent process: pwsh.exe
- Execution context: Hidden PowerShell

## Step 6 – Conclusion
This lab demonstrates how Sysmon Event ID 1 can be used to detect PowerShell executions using the -EncodedCommand flag.
Such behavior is commonly associated with obfuscated or malicious activity and should be investigated.
