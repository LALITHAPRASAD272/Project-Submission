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
22/tcp                     ALLOW IN    <YOUR_LOCAL_LAPTOP_IP_HERE>
80/tcp                     ALLOW IN    Anywhere
8000/tcp                   ALLOW IN    Anywhere
```

**Result:**

- Firewall is active.
- Default incoming traffic is blocked.
- Only approved ports are accessible.

This confirms the firewall policy is successfully enforced.

---

## Security Outcome

✅ Default deny policy enabled  
✅ Outgoing traffic allowed  
✅ SSH access restricted to trusted IP  
✅ Web traffic allowed on port 80  
✅ Application traffic allowed on port 8000  
✅ Firewall active and protecting the server
