echo "Removing dynatrace agent namespace"
kubectl delete namespace dynatrace

echo "Removing nginx ingress namespace"
kubectl delete namespace ingress-nginx

echo "Removing dynatrace demo namespace"
kubectl delete namespace dynatrace-demo

#echo "Removing web UI dashboard"
#kubectl delete namespace kubernetes-dashboard

echo "All services, pods, deployments, and ingresses created for the demo are now removed"