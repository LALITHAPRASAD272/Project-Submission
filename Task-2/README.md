# Task 2: Docker Installation and Application Deployment

## Objective

Install Docker on an Ubuntu server and deploy a lightweight web application inside a container, exposing it on port **8000**.

---

## Server Details

- **Cloud Provider:** Azure
- **Operating System:** Ubuntu 24.04 LTS
- **Container Engine:** Docker
- **Application Port:** 8000

---

## Implementation Steps

### 1. Install Docker Engine

Updated package lists and installed Docker:

```bash
sudo apt update
sudo apt install docker.io -y
```

Started and enabled the Docker service:

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

This ensures Docker starts automatically after every reboot.

---

### 2. Build Docker Image

Built the application image using the local Dockerfile:

```bash
docker build -t devops-web-app:v1 .
```

**Explanation:**

- `docker build` → Builds a Docker image.
- `-t` → Tags the image with a custom name and version.
- `.` → Uses the current directory as the build context.

This creates the application image locally.

---

### 3. Run Docker Container

Started the container in detached mode and mapped port 8000:

```bash
docker run -d -p 8000:8000 --name my-running-app devops-web-app:v1
```

**Explanation:**

- `-d` → Runs the container in background mode.
- `-p 8000:8000` → Maps host port 8000 to container port 8000.
- `--name` → Assigns a custom name to the container.

This deploys the application and makes it accessible externally.

---

## Verification

### Check Running Containers

Verified the running container using:

```bash
docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}"
```

**Output:**

```plaintext
CONTAINER ID   NAMES            PORTS                     STATUS
e23b45f121aa   my-running-app   0.0.0.0:8000->8000/tcp   Up About a minute
```

**Result:**

- Container is active.
- Port mapping is correctly configured.

---

### Access Application Endpoint

Tested the deployed application through browser or curl:

```bash
curl http://<VM-Public-IP>:8000
```

or open in browser:

```plaintext
http://<VM-Public-IP>:8000
```

**Result:**

- Application responded successfully.
- Deployment confirmed working.

---

## Deployment Outcome

✅ Docker installed successfully  
✅ Docker service enabled and running  
✅ Application image built successfully  
✅ Container deployed on port 8000  
✅ Application accessible via public IP
