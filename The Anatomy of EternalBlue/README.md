# The Anatomy of EternalBlue

This lecture explains EternalBlue as a case study in SMB exploitation, vulnerability analysis, exploit detection, logging, and patch-based mitigation.

## Materials

- `The Anatomy of EternalBlue Exploiting a Critical SMB Vulnerability.pdf` - lecture slides.

## Main Topics

- Historical context of EternalBlue, the 2017 Shadow Brokers leak, CVE-2017-0144, and the WannaCry outbreak.
- SMB protocol basics and why exposed SMB services on TCP port 445 are high-value targets.
- Vulnerability details involving malformed SMB transaction requests, Trans2 Secondary handling, buffer overflow conditions, and remote code execution.
- Exploitation phases including reconnaissance, SMB session setup, buffer grooming, payload delivery, shellcode execution, and possible DoublePulsar backdoor integration.
- Lab analysis using Metasploit, Wireshark, SMB traffic filters, status codes such as `STATUS_INSUFF_SERVER_RESOURCES`, and Windows Event Viewer indicators.
- Mitigation using the MS17-010 patch, disabling unnecessary services, minimizing attack surface, segmentation, and monitoring.

## Lecture Goal

The goal is to understand how a single protocol vulnerability can lead to large-scale compromise, and why patch management, logging, network segmentation, and attack-surface reduction are critical defenses.
