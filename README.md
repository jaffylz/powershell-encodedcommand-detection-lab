# PowerShell EncodedCommand Detection Lab

## Overview
This lab demonstrates the detection of obfuscated PowerShell execution using the `-EncodedCommand` parameter, a technique frequently abused by attackers.

The objective is to simulate a realistic post-exploitation technique and validate detection using host-based telemetry (Sysmon).

---

## Threat Scenario
An attacker with initial access to a Windows host executes PowerShell with a Base64-encoded payload to:
- evade command-line inspection
- bypass basic security controls
- hide execution intent

**MITRE ATT&CK Mapping**
- T1059.001 – PowerShell

---

## Lab Environment
- Windows 10 / 11
- Sysmon installed and configured
- PowerShell 5+
- Local execution (no internet access)

---

## Attack Simulation
The following technique is executed:
- A PowerShell payload is created locally
- The payload is encoded using Base64 (Unicode)
- PowerShell is launched with:
  - `-EncodedCommand`
  - `-WindowStyle Hidden`
  - `-NoProfile`

This mirrors real-world attacker behavior using native Windows tooling.

---

## Detection
**Telemetry Source**
- Sysmon Event ID 1 (Process Creation)

**Detection Indicators**
- `powershell.exe` process creation
- Presence of `-EncodedCommand` in the command line
- Hidden execution context
- Encoded payload visible in `CommandLine`

## Detection Validation

The Sigma rule was validated against a real Sysmon Event ID 1 generated during the lab.

Observed indicators:
- powershell.exe executed with -EncodedCommand
- Base64 payload present in CommandLine
- Hidden execution context (-WindowStyle Hidden)

The rule conditions successfully match the generated event, confirming detection accuracy.

---

## Analysis
Analysis of the Sysmon event confirms:
- Base64-encoded payload embedded in the process command line
- Obfuscation used to conceal execution logic
- Execution consistent with post-exploitation tradecraft

This behavior should be treated as high-risk in enterprise environments.

---

## Conclusion
This lab validates that Sysmon process creation telemetry can reliably detect obfuscated PowerShell execution.

Such techniques are commonly abused and should trigger investigation or automated response.

---

## Next Improvements
- Decode and analyze payload content
- Correlate with PowerShell Script Block Logging (Event ID 4104)
- Add Sigma detection rule
- Map detection logic to SIEM platforms (Elastic / Sentinel)

---

## Evidence
- Sysmon Event ID 1 capturing `powershell.exe`
- Full command line containing Base64 payload
- Hidden execution context observed
