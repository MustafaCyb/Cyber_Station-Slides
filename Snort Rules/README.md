# Snort Rules

This lecture teaches how Snort IDS/IPS rules are structured, how detection logic works, and how rules can support digital forensics, malware analysis, and web attack detection.

## Materials

- `Snort-Rules.pdf` - lecture slides.
- `IDS_Setup.sh` - setup script used for the IDS lab environment.

## Main Topics

- Snort operating modes: sniffer mode, packet logger mode, and NIDS/NIPS mode.
- Snort rule anatomy: rule header and rule options.
- Header components such as action, protocol, source, destination, ports, and direction.
- Rule options such as `msg`, `content`, `pcre`, `sid`, `rev`, `classtype`, `flow`, `flags`, `threshold`, and `metadata`.
- Detection pipeline from capture to decoding, processing, detection, evaluation, alerting, and logging.
- Practical examples for WannaCry/MS17-010, SQL injection detection, sqlmap detection, boolean/error-based SQLi, UNION-based SQLi, and time-based blind SQLi.
- Forensic use cases such as traffic reconstruction, C2 beacon detection, data exfiltration indicators, and lateral movement detection.

## Lecture Goal

The goal is to help students write specific, testable, and maintainable Snort rules, while understanding the forensic value of alerts and packet evidence.
