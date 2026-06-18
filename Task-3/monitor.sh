```bash
#!/bin/bash
# Dedicated System Resources Monitor Engine Script

# Configurations Parameters Target Path
LOG_FILE="/opt/container-monitor/logs/container_stats.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Check if target endpoint tracking container is responsive or context returns data
if ! docker ps | grep -q "my-running-app"; then
    echo "[$TIMESTAMP] Error: Target application container instance unreachable." >> $LOG_FILE
    exit 1
fi

# Extract and record parsed statistics metrics
CONTAINER_STATS=$(docker stats my-running-app --no-stream --format "Container: {{.Name}} | CPU: {{.CPUPerc}} | Mem: {{.MemUsage}}")

# Safely output parameters payload into logs storage matrix
echo "[$TIMESTAMP] $CONTAINER_STATS" >> $LOG_FILE
