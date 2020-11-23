# Dynatrace demo

This demo repository demonstrates [Dynatrace](https://www.dynatrace.com) used with [Kubernetes](https://kubernetes.io)

# Setup

## Install dependencies

From the project root

```shell script
npm install
```

Will install dependencies for each service

## Kubernetes Web UI

You can optionally set up the kubernetes web UI by following [these instructions](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/)

Once you've [created a sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md) and copied the Bearer Token, expose the web UI with:

```shell script
kubectl proxy
```

It should now be available at http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
