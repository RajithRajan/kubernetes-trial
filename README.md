# kubernetes-trial
Sample k8s manifests

## Deployment

## Ingress
For ingress to work it required additional ingress controller installed on the cluster, like
Nginx controller \
AWS Load balancer controller

## Job

## Pod

## ResourceQuota
Its used to limit the resource consumed per namespace. Its not limited to CPU or Memory, but can we put limits on count of cm, pvc, pod, rc ... etc.

Below command can be used to apply the resourcequota on gitlab namespace \
`kubectl apply -f ns-resourcequota.yml -n gitlab`

Reference
https://kubernetes.io/docs/concepts/policy/resource-quotas/