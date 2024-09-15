cat <<EOF | microk8s.kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: a2odev-company
EOF
