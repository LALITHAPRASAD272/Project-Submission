# Task 1: Server Setup and SSH Configuration

## Objective

Provision a remote Ubuntu server on Azure and configure SSH authentication using asymmetric key-pair verification instead of password-based login.

---

## Server Details

- **Cloud Provider:** Azure
- **Operating System:** Ubuntu 24.04 LTS
- **Purpose:** Secure remote server access using SSH key authentication

---

## Implementation Steps

### 1. Provisioned Ubuntu VM

Created an Ubuntu 24.04 LTS virtual machine instance on the Azure cloud platform.

---

### 2. SSH Key Configuration

Configured SSH access by injecting the public key into the server during VM creation.

This enabled passwordless authentication using the private key from the local machine.

---

### 3. Backup Existing SSH Configuration

Before making any modifications, created a backup of the default SSH configuration file.

```bash
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
```

This allows rollback in case of misconfiguration.

---

### 4. Modify SSH Configuration

Opened the SSH daemon configuration file:

```bash
sudo nano /etc/ssh/sshd_config
```

Updated the following directives:

```plaintext
PubkeyAuthentication yes
PasswordAuthentication no
```

**Explanation:**

- `PubkeyAuthentication yes` → Enables SSH key-based authentication.
- `PasswordAuthentication no` → Disables password-based login.

This ensures that only users with authorized private keys can access the server.

---

### 5. Restart SSH Service

Applied the configuration changes by restarting the SSH daemon:

```bash
sudo systemctl restart ssh
```

This makes the updated authentication settings active immediately.

---

## Verification

### Successful SSH Login (Key-Based Authentication)

Verified successful login using the private SSH key:

```bash
ssh -i ~/.ssh/id_rsa azureuser@<VM-IP>
```

**Result:**

- Access granted successfully.
- No password prompt appeared.
- Authentication completed using the configured key pair.

---

### Failed Password-Based Login Attempt

Attempted login without using the private key:

```bash
ssh azureuser@<VM-IP>
```

**Output:**

```plaintext
azureuser@<VM-IP>: Permission denied (publickey).
```

**Result:**

- Password authentication was rejected.
- Only public key authentication was allowed.

This confirms that SSH hardening was successfully enforced.

---

## Security Outcome

✅ Server provisioned successfully on Azure  
✅ SSH key authentication enabled  
✅ Password authentication disabled  
✅ Unauthorized password login blocked  
✅ Backup configuration retained for rollback
