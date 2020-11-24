# Dynatrace demo

This demo repository demonstrates [Dynatrace](https://www.dynatrace.com) used with [Kubernetes](https://kubernetes.io)

# Setup

## Prerequisites

### Docker / k8s

You'll need [Docker](https://www.docker.com/products/docker-desktop) installed to use this demo.
You'll also need to enable the built-in Kubernetes cluster.

### Dynatrace

Create two environment variables for `DYNATRACE_API_TOKEN` and `DYNATRACE_PAAS_TOKEN`

Follow the docs to generate them:

- [API Token](https://www.dynatrace.com/support/help/dynatrace-api/basics/dynatrace-api-authentication/)
- [PaaS Token](https://www.dynatrace.com/support/help/reference/dynatrace-concepts/access-tokens/#anchor_paas-token)

## Install Project Dependencies

Run from the project root. This will install dependencies for each service.

```shell script
npm install
```

## Build docker images

There are several images that need to be built.
Build them all by running:

```shell script
sh build-images.sh
```

## Apply Kubernetes Configuration

Apply the k8s configuration, replica scale can be modified for demonstration purposes.
Configuration lives in `deployment.yaml`

```shell script
sh deploy-kube.sh
```

## Kubernetes Web UI

You can optionally set up the kubernetes web UI.
The script will install it automatically, but you'll need to [create a sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md) and save the Bearer Token to login with.
expose the web UI with:

```shell script
kubectl proxy
```

It should now be available at http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

## Cleaning up

This will remove all namespace, and associated pods, deployments, and ingresses

```shell script
sh cleanup.sh
```

# Development

Local development of the demo apps without kube or dynatrace monitoring

### Setup

Install dependencies the same way from the project root

```shell script
npm install
```

### Dev Server

Docker/k8s is not required for the development server

```shell script
npm run start:dev
```

This will start the React app in dev mode, and the server layers with a proxy for the React app.
They should behave the same as their containerized counterparts.

# References

### Kubernetes

- [nginx ingress rewrite](https://kubernetes.github.io/ingress-nginx/examples/rewrite/)

### Dynatrace

- [Deploy OneAgent](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/kubernetes/deploy-oneagent-k8/)
- [Set up kubernetes integration](https://www.dynatrace.com/support/help/technology-support/cloud-platforms/kubernetes/monitoring/monitor-kubernetes-clusters-with-dynatrace/)
