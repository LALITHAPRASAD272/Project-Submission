# Task 5: Firewall Configuration

## Objective

Configure firewall rules to block all unnecessary incoming traffic by default and allow access only to specific required ports.

---

## Firewall Configuration Details

- **Firewall Tool:** UFW (Uncomplicated Firewall)
- **Default Incoming Policy:** Deny
- **Default Outgoing Policy:** Allow
- **Allowed Ports:** 22, 80, 8000

---

## Implementation Steps

### 1. Configure Default Firewall Policies

Set default firewall behavior:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

**Explanation:**

- `deny incoming` → Blocks all incoming traffic by default.
- `allow outgoing` → Allows all outbound connections.

This establishes a secure default network policy.

---

### 2. Allow SSH Access for Specific IP

Restricted SSH access to only the local machine IP:

```bash
sudo ufw allow from <YOUR_LOCAL_LAPTOP_IP_HERE> to any port 22 proto tcp
```

**Explanation:**

- Allows SSH only from a trusted IP address.
- Prevents unauthorized remote SSH access.

This improves security by limiting administrative access.

---

### 3. Allow Application Ports

Allowed HTTP traffic:

```bash
sudo ufw allow 80/tcp
```

Allowed custom application port:

```bash
sudo ufw allow 8000/tcp
```

**Explanation:**

- Port `80` → Standard web traffic.
- Port `8000` → Docker application access.

This makes the deployed application reachable externally.

---

### 4. Enable Firewall

Activated firewall rules:

```bash
sudo ufw enable
```

This applies all configured rules immediately.

---

## Verification

### Check Firewall Status

Verified active firewall configuration:

```bash
sudo ufw status verbose
```

**Output:**

```plaintext
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)

To                         Action      From
--                         ------      ----
22/tcp                     ALLOW IN    205.254.169.218
80/tcp                     ALLOW IN    Anywhere
8000/tcp                   ALLOW IN    Anywhere
80/tcp (v6)                ALLOW IN    Anywhere (v6)
8000/tcp (v6)              ALLOW IN    Anywhere (v6)
```

**Result:**

- Firewall is active and enforcing rules.
- SSH access is restricted to the trusted IP address (`205.254.169.218`).
- HTTP traffic is allowed on port `80`.
- Application traffic is allowed on port `8000`.
- IPv6 traffic is also configured for ports `80` and `8000`.

This confirms the firewall configuration is correctly applied and the server is protected against unauthorized incoming connections.

---

## Security Outcome

✅ Default deny policy enabled  
✅ Outgoing traffic allowed  
✅ SSH access restricted to trusted IP  
✅ Web traffic allowed on port 80  
✅ Application traffic allowed on port 8000  
✅ Firewall active and protecting the server
