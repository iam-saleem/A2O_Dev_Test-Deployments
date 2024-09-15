# Deployment Configuration Script

This project contains a script (`script.sh`) that automates the post-deployment optimization and configuration of Docker containers labeled `com.a2odev.app=sigma`.

## Criteria

The script performs the following tasks:
1. Finds all Docker containers labeled `com.a2odev.app=sigma`.
2. Sets a memory limit of 64Mb on matching containers.
3. Sets a restart policy rule of "No more than 5 times after failure" on matching containers.

## Instructions

### Prerequisites

- Docker must be installed and running on the Ubuntu 22.04 server.
- The user running the script must have the necessary permissions to manage Docker containers.

### Steps to Execute

1. **Clone the Repository**:
   ```bash
   git clone <repository-url> evaluation-candidate-x
   cd evaluation-candidate-x

2. **Make the Script Executable**:
   ```bash
   chmod +x script.sh

3. **Run the Script**:
   ```bash
   ./script.sh

# Docker Container Optimization Test

## Overview

This document outlines the process for testing a script designed to apply specific memory limits and restart policies to Docker containers based on their labels. 

## Instructions

1. **Create Docker Containers**
   - Create a set of Docker containers with arbitrary labels.
   - Ensure some containers are labeled with `com.a2odev.app=sigma`.

2. **Place and Execute Script**
   - Place the `script.sh` file in the `evaluation-candidate-x` folder.
   - Execute the script following the instructions provided above.

3. **Inspect Containers**
   - Verify that the memory limit and restart policy have been applied only to those containers labeled `com.a2odev.app=sigma`.

## Example Scenarios

### Scenario 1

#### Labeled Containers
- `redis-service` and `api-gw` with label `com.a2odev.app=sigma`
- `proxy-server` with label `com.a3odev.api=sigma`

#### State Before Optimization
- `redis-service`: Memory limit: 14.6GiB, Restart policy: No / 0
- `api-gw`: Memory limit: 14.6GiB, Restart policy: No / 0
- `proxy-server`: Memory limit: 14.6GiB, Restart policy: No / 0

#### State After Optimization
- `redis-service`: Memory limit: 64MiB, Restart policy: on-failure / 5
- `api-gw`: Memory limit: 64MiB, Restart policy: on-failure / 5
- `proxy-server`: Memory limit: 14.6GiB, Restart policy: No / 0

### Scenario 2

#### Labeled Containers
- `nginx-service` with label `com.a2odev.app=sigma`
- `mysql-db-service` with label `com.a2odev.api.app=sigma`
- `mongodb-service` with label `com.a2odev.app=sigma`

#### State Before Optimization
- `nginx-service`: Memory limit: 14.6GiB, Restart policy: No / 0
- `mysql-db-service`: Memory limit: 14.6GiB, Restart policy: No / 0
- `mongodb-service`: Memory limit: 14.6GiB, Restart policy: No / 0

#### State After Optimization
- `nginx-service`: Memory limit: 14.6GiB, Restart policy: No / 0
- `mysql-db-service`: Memory limit: 14.6GiB, Restart policy: No / 0
- `mongodb-service`: Memory limit: 64MiB, Restart policy: on-failure / 5

## Conclusion

By following the instructions provided, the QA collaborator should be able to verify that the script correctly applies the memory limit and restart policy to the appropriate containers.
