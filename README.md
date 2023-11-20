# Daemonset-CleanUp-Docker-Images
Repository with DaemonSet on Kubernetes to make docker prune inside all Kubernetes Nodes

Run command bellow to create docker image and push to ECR:

```
docker build -t docker-cleanup:1.0 .
```

[Push Docker Image to ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html)

Run command bellow to create the DaemonSet inside your K8S Cluster:

```
kubectl create ns docker-cleanup
kubectl apply -f CleanUp-Images-Nodes.yaml
```
