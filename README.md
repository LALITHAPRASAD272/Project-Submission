# DevOps Intern Technical Assignment Submission

## Overview

This repository contains the complete implementation of the DevOps Intern technical assignment.

The project covers secure server provisioning, Docker-based application deployment, automated resource monitoring, secure log management with restricted permissions, and firewall configuration for server hardening.

---

## Project Structure

```plaintext
.
├── Task-1/
├── Task-2/
├── Task-3/
├── Task-4/
└── Task-5/
```

### Task Breakdown

### Task-1: Server Setup and SSH Configuration

* Provisioned an Ubuntu 24.04 LTS VM on Azure.
* Configured SSH key-based authentication.
* Disabled password-based SSH login.
* Hardened SSH access.

---

### Task-2: Docker Installation and Application Deployment

* Installed Docker on the Ubuntu server.
* Built the application Docker image.
* Deployed the containerized application.
* Exposed the application on port **8000**.

---

### Task-3: Resource Monitoring and Cron Automation

* Created a monitoring script to track container CPU and memory usage.
* Configured cron jobs to automate monitoring every minute.
* Logged resource metrics with timestamps.

---

### Task-4: Secure Monitoring Logs and Access Control

* Created a dedicated low-privilege monitoring user.
* Restricted monitoring logs using POSIX permissions.
* Prevented unauthorized users from accessing logs.

---

### Task-5: Firewall Configuration

* Configured UFW firewall rules.
* Set default incoming traffic policy to deny.
* Allowed only required ports (**22, 80, 8000**).
* Restricted SSH access to a trusted IP.

---

## Video Walkthrough

A complete walkthrough video demonstrating the implementation and verification steps is available below:

**Google Drive Link:**
[Insert Video Link Here]

---

## Final Outcome

✅ Secure server setup completed

✅ SSH hardened successfully

✅ Docker application deployed successfully

✅ Monitoring automation enabled

✅ Access controls enforced

✅ Firewall rules configured and verified
