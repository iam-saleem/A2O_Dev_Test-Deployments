cat <<EOF | microk8s.kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: a2odev-company
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        resources:
          requests:
            memory: "64Mi"
            cpu: "100m"
        livenessProbe:
          exec:
            command:
            - nginx
            - -t
          initialDelaySeconds: 60
          periodSeconds: 60
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  namespace: a2odev-company
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
EOF
