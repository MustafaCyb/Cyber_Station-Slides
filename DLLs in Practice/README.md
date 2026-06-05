# DLLs in Practice

This lecture explains Dynamic Link Libraries (DLLs), their role in Windows, and why they matter for operating system security and cyber defense.

## Materials

- `DLLs.pdf` - lecture slides.

## Main Topics

- What DLL files are and why applications use shared code modules.
- How DLLs are loaded into memory and shared by processes.
- Important Windows DLLs such as `kernel32.dll`, `ntdll.dll`, `advapi32.dll`, and `crypt32.dll`.
- The role of `ntdll.dll` between user mode and kernel mode.
- How DLLs support code integrity, ASLR, DEP, privilege management, secure communication, and system stability.
- Simple C examples for creating a DLL and loading it from another program.
- Common DLL-related risks including buffer overflows, privilege escalation, DLL injection, malicious DLLs, data exfiltration, remote code execution, and denial of service.

## Lecture Goal

The goal is to help students understand DLLs as normal Windows components first, then understand how attackers abuse the same loading and memory mechanisms during malware and injection scenarios.
