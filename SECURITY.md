# Security Policy

## Reporting Security Issues

We always aim to ship secure software and take security flaws seriously. Thank you for responsibly disclosing your findings to the team to keep the open source community a safe space.

To report a security issue, open an issue in this repository. Include enough detail to reproduce the problem.

## Antivirus detections and build verification

Black Hole Break is a native C/Win32 application, not a .NET/MSIL program. The executable
contains explicit user-facing features that can resemble malware heuristics:
optional Startup-folder shortcut creation, GitHub release update checks,
downloaded Markdown images, and user-approved plugin process launching. Plugin
PowerShell files run under the host PowerShell execution policy; Black Hole Break does
not request an execution-policy bypass. These paths are bounded and validated
in the source; Black Hole Break does not inject into other processes or install a hidden
service.

Unsigned MinGW builds can also receive reputation-based or heuristic detections;
older samples should not be used as the security baseline for a newly built binary.

The `security / source-policy` job runs before CI and release builds. It blocks
PowerShell execution-policy bypass arguments and high-entropy tokens embedded
in URLs. It also prevents build settings that disable stack protection, strip
all PE metadata, or suppress the PE timestamp. Release builds use conventional
size optimization, retain PE metadata needed for diagnostics, and remove only
linker symbols that are not required at runtime. The pinned 32-bit release build
keeps embedded language, font, icon, dialog, version, and manifest data in
standard Windows resources instead of a custom compressed container. These
choices keep avoidable heuristic triggers out of compiled builds; approved
short public links remain valid.

The pinned 32-bit CI build enforces a 4096 KiB unsigned executable budget.
The published GPU/D3D11 build is about 3.4 MB, and that budget leaves room for
the black-hole renderer, embedded assets, and an Authenticode signature.

The GitHub Actions `security / virustotal` job uploads the final CI artifact and
writes the SHA-256, VirusTotal link, engine counts, and any engine names to the
workflow summary. Configure the repository Actions secret
`VIRUSTOTAL_API_KEY` to enable uploads. If the secret is absent, the GitHub
job records a skipped scan in the Actions Summary and does not block the build
or release. Fork pull requests are excluded from upload jobs and do not receive
a secret.

The VirusTotal report is stored only as an Actions artifact and in the job
summary. It is deliberately not included in the GitHub Release assets.

VirusTotal submissions are visible to VirusTotal's analysis service and public
API keys are rate-limited, so use this workflow only for binaries intended for
public distribution (or an account/plan approved for your release process).

When reporting a suspected false positive, include the exact SHA-256 and the
VirusTotal report URL from the workflow summary. Submit the same hash to the
vendor's false-positive portal; do not rely on a renamed or repackaged file.

