# Task 3: Resource Monitoring and Cron Automation

## Objective

Set up an automated cron job to collect system and container resource usage metrics such as CPU and memory consumption at regular one-minute intervals.

---

## Monitoring Details

- **Monitoring Method:** Shell Script
- **Automation Tool:** Cron
- **Frequency:** Every 1 minute
- **Log Location:** `/opt/container-monitor/logs/container_stats.log`

---

## Implementation Steps

### 1. Create Monitoring Script

Created and stored the monitoring script inside the system.

Example location:

```bash
/home/monitor_user/monitor.sh
```

The script collects:

- Container name
- CPU usage
- Memory usage
- Timestamp

This enables continuous tracking of resource consumption.

---

### 2. Configure Cron Job

Opened the cron configuration for the current user:

```bash
crontab -e
```

Added the following cron entry:

```text
* * * * * /bin/bash /home/monitor_user/monitor.sh
```

**Explanation:**

- `* * * * *` → Executes every minute.
- `/bin/bash` → Runs the shell interpreter.
- `/home/monitor_user/monitor.sh` → Executes the monitoring script.

This automates metric collection without manual intervention.

---

## Verification

### Check Cron Job Configuration

Verified the active cron jobs:

```bash
crontab -l
```

**Output:**

```plaintext
* * * * * /bin/bash /home/monitor_user/monitor.sh
```

This confirms the scheduled automation is active.

---

### Inspect Monitoring Logs

Checked the generated log file:

```bash
cat /opt/container-monitor/logs/container_stats.log
```

**Output:**

```plaintext
[2026-06-18 15:21:01] Container: my-running-app | CPU: 0.00% | Mem: 2.633MiB / 7.756GiB
[2026-06-18 15:22:01] Container: my-running-app | CPU: 0.01% | Mem: 2.635MiB / 7.756GiB
[2026-06-18 15:23:01] Container: my-running-app | CPU: 0.00% | Mem: 2.633MiB / 7.756GiB
```

**Result:**

- Logs are being generated every minute.
- CPU and memory metrics are being captured correctly.
- Timestamp entries confirm cron automation is working.

---

## Monitoring Outcome

✅ Monitoring script created successfully  
✅ Cron automation configured successfully  
✅ Resource metrics captured every minute  
✅ Logs stored with timestamp records  
✅ Container performance monitoring enabled
