# Cryptography for Hackers

This lecture introduces cryptography from both a defensive and attacker-aware perspective. It starts with basic crypto concepts, then connects them to network security, secure messaging, data protection, malware evasion, and ransomware.

## Materials

- `Cryptography in real world applications & malware functionalities .pdf` - lecture slides.

## Main Topics

- Plaintext, ciphertext, keys, algorithms, encryption, hashing, MACs, and signatures.
- Symmetric encryption such as AES and ChaCha20.
- Asymmetric encryption such as RSA and ECC.
- Hashing and HMAC for integrity and authenticity.
- TLS/HTTPS, secure messaging, email encryption, disk/database encryption, and key management.
- How malware may use encrypted or packed payloads to reduce static visibility.
- How ransomware uses hybrid encryption with fast symmetric file encryption and asymmetric key protection.

## Lecture Goal

The goal is to understand why cryptography is essential for confidentiality, integrity, authentication, and non-repudiation, while also recognizing that the same techniques can be abused by attackers. The defensive takeaway is that cryptography must be combined with detection, response, segmentation, least privilege, and reliable offline backups.
