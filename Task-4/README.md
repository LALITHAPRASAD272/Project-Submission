# Task 4: Secure Monitoring Logs and Access Control

## Objective

Implement file system access controls to restrict monitoring log access exclusively to a dedicated low-privilege user using POSIX permissions.

---

## Security Configuration Details

- **Dedicated User:** `monitor_user`
- **Protected Directory:** `/opt/container-monitor`
- **Logs Directory:** `/opt/container-monitor/logs`
- **Permission Model:** POSIX File Permissions

---

## Implementation Steps

### 1. Create Dedicated Monitoring User

Created a dedicated low-privilege user for handling monitoring operations:

```bash
sudo adduser monitor_user
```

Added the user to the Docker group:

```bash
sudo usermod -aG docker monitor_user
```

**Explanation:**

- `adduser` → Creates a separate monitoring account.
- `usermod -aG docker` → Grants Docker access for monitoring containers.

This isolates monitoring operations from the main administrative account.

---

### 2. Create Monitoring Directory Structure

Created the monitoring directory and logs folder:

```bash
sudo mkdir -p /opt/container-monitor/logs
```

Assigned ownership to the monitoring user:

```bash
sudo chown -R monitor_user:monitor_user /opt/container-monitor
```

**Explanation:**

- `mkdir -p` → Creates the required directory path.
- `chown -R` → Recursively assigns ownership.

This ensures only the monitoring user controls the files.

---

### 3. Restrict Directory Permissions

Applied strict access permissions:

```bash
sudo chmod 700 /opt/container-monitor
sudo chmod 700 /opt/container-monitor/logs
```

**Explanation:**

- `700` → Full access for owner only.
- No access for group or others.

This prevents unauthorized access from other system users.

---

## Verification

### Unauthorized Access Attempt (azureuser)

Tried accessing logs using an unprivileged user:

```bash
cat /opt/container-monitor/logs/container_stats.log
```

**Output:**

```plaintext
cat: /opt/container-monitor/logs/container_stats.log: Permission denied
```

**Result:**

- Access blocked successfully.
- Unauthorized users cannot read monitoring logs.

---

### Authorized Access (monitor_user)

Switched to the dedicated monitoring user:

```bash
sudo su - monitor_user
```

Accessed the logs:

```bash
cat /opt/container-monitor/logs/container_stats.log
```

**Output:**

```plaintext
[2026-06-18 15:22:01] Container: my-running-app | CPU: 0.01% | Mem: 2.635MiB / 7.756GiB
```

**Result:**

- Access granted successfully.
- Monitoring user can read logs without issues.

This confirms access control policies are correctly enforced.

---

## Security Outcome

✅ Dedicated monitoring user created  
✅ Docker access restricted to monitoring user  
✅ Monitoring directory ownership assigned correctly  
✅ Unauthorized access blocked  
✅ Monitoring logs protected with strict POSIX permissions
