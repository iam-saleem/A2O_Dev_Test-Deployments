Testing Instructions
# Deployment and HPA Testing Instructions

## Prerequisites
- MicroK8s installed and running on Ubuntu 22.04
- Git installed

## Steps to Deploy and Test

1. **Clone the Repository**
   ```bash
   git clone <repository-url> evaluation-candidate-x
   cd evaluation-candidate-x

2. **Apply Kubernetes Manifests**
   ```bash
   microk8s.kubectl apply -f namespace.yaml
   microk8s.kubectl apply -f deployment.yaml
   microk8s.kubectl apply -f hpa.yaml

3. **Verify Deployment**
   ```bash
   microk8s.kubectl get all -n a2odev-company

4. **microk8s.kubectl get all -n a2odev-company**
   Increase load using a load testing tool (e.g., kubectl run -i --tty load-generator --image=busybox /bin/sh and run while true; do wget -q -O- http://nginx-service.a2odev-company.svc.cluster.local; done).Monitor HPA behavior:
   
   ```bash
   microk8s.kubectl get hpa -n a2odev-company

5. **Test Liveness Probe**
   Simulate a failure in the nginx container and observe the liveness probe restarting the container:
   ```bash
   microk8s.kubectl describe pod <nginx-pod-name> -n a2odev-company

**CleanupTo clean up the resources**:
```bash
microk8s.kubectl delete namespace a2odev-company

### Explanation of the HPA Algorithm
The HPA uses the following formula to determine the desired number of replicas:

```plaintext
desiredReplicas = ceil[currentReplicas * ( currentMetricValue / desiredMetricValue )]
For example:If the current number of replicas is 1 and the average CPU usage is 150%, the desired number of replicas would be:
```plaintext
desiredReplicas = ceil[1 * (150 / 50)] = ceil[3] = 3
If the current number of replicas is 3 and the average CPU usage drops to 25%, the desired number of replicas would be:
```plaintext
desiredReplicas = ceil[3 * (25 / 50)] = ceil[1.5] = 2

This ensures that the number of replicas scales up or down based on the current load, maintaining optimal performance and resource utilization.By following these steps, you will have a fully functional HPA setup for your web server on a MicroK8s cluster, meeting all the specified criteria.
   
