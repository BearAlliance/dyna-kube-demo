# Web UI Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# Ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.41.2/deploy/static/provider/cloud/deploy.yaml

# Dynatrace agent
kubectl create namespace dynatrace
kubectl apply -f https://github.com/Dynatrace/dynatrace-oneagent-operator/releases/latest/download/kubernetes.yaml

kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=$DYNATRACE_API_TOKEN" --from-literal="paasToken=$DYNATRACE_PAAS_TOKEN"

# Dynatrace OneAgent
kubectl apply -f custom-resource.yaml

# Demo application deployment
kubectl create namespace dynatrace-demo
kubectl apply -f ./deployment.yaml