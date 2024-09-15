#!/bin/bash

# Find all Docker containers labeled "com.a2odev.app=sigma"
containers=$(docker ps --filter "label=com.a2odev.app=sigma" --format "{{.ID}}")

# Loop through each container and apply the configurations
for container in $containers; do
  # Set a memory limit of 64Mb
  docker update --memory 64m $container
  
  # Set a restart policy rule of "No more than 5 times after failure"
  docker update --restart on-failure:5 $container
done

echo "Optimization applied to containers with label com.a2odev.app=sigma"
