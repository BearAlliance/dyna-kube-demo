# Dynatrace agent
kubectl create namespace dynatrace
kubectl -n dynatrace create secret generic oneagent --from-literal="apiToken=$DYNATRACE_API_TOKEN" --from-literal="paasToken=$DYNATRACE_PAAS_TOKEN"
kubectl apply -f https://github.com/Dynatrace/dynatrace-oneagent-operator/releases/latest/download/kubernetes.yaml

# Dynatrace OneAgent
kubectl apply -f custom-resource.yaml

# Dynatrace service account
kubectl apply -f https://www.dynatrace.com/support/help/codefiles/kubernetes/kubernetes-monitoring-service-account.yaml

# Web UI Dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml

# Ingress controller
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.41.2/deploy/static/provider/cloud/deploy.yaml

# Demo application deployment
kubectl create namespace dynatrace-demo
kubectl apply -f ./deployment.yaml

# Stuff for later
echo "
Dynatrace bearer token:"
kubectl get secret $(kubectl get sa dynatrace-monitoring -o jsonpath='{.secrets[0].name}' -n dynatrace) -o jsonpath='{.data.token}' -n dynatrace | base64 --decode
echo ""

echo "The Kubernetes API URL is:"
kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}'
