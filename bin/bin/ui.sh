#kubectl --namespace=prometheus port-forward deploy/prometheus-server 9090 &
#kubectl port-forward svc/weave-scope-app -n weave 4040:80
kubectl proxy
