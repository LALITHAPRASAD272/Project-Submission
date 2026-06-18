# Task 1: Server Setup and SSH Configuration

## Implementation Blueprint
- [cite_start]**Environment**: Linux Ubuntu Instance deployed on Azure Infrastructure[cite: 6].
- [cite_start]**Methodology**: Restricted password access profiles and enabled exclusively public key-pair validation tokens[cite: 8, 10].

## Configuration Actions Triggered
1. [cite_start]Captured VM public access points and loaded local system asymmetric identity vectors[cite: 7, 8].
2. Hardened OpenSSH server configurations:
   ```bash
   sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
   sudo nano /etc/ssh/sshd_config
