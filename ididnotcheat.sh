#!/bin/bash

# Il ne doit pas y avoir d'autre container que minikube & buildkit démarré
echo "Check Docker..." |figlet
if [[ $(docker ps -aq|grep -v -E $(docker ps -aq  -f name=dagger-buildkitd -f name=minikube| paste -sd "|" -)) ]]; then
    echo "Roohhh... "
    exit 1
else
    echo "Ok !"
fi

# Minikube crée par default des ns: default, kube-node-lease, kube-public, kube-system
echo "Check Kube..." |figlet
if [[ "$(kubectl get ns  |wc -l)" -gt 5 ]]; then
    echo "Supprime les namespaces..."
    exit 1
else
    echo "Ok !"
fi

echo ""
cowsay "N'oublie pas la loi de Murphy..." 2>/dev/null