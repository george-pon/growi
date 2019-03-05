#!/bin/bash

EDITOR=${EDITOR:-vi}
echo EDITOR is $EDITOR

set -eux
docker version
kubectl version
helm version
set +eux

# edit version number
$EDITOR README.md helm-chart/growi/Chart.yaml

# build helm-chart package
bash package-helm-chart.sh

# test run via helm
pushd helm-chart
    PRESENT=$( helm list growi )
    if [ -z "$PRESENT" ] ; then
        # use local image name
        helm install growi --name growi --set image.pullPolicy=Always
    else
        # use local image name
        helm upgrade growi growi --set image.pullPolicy=Always
    fi
    # wait for deploy
    kubectl rollout status deploy/growi
popd

echo ""
echo "Note"
echo ""
echo "1. add '192.168.33.11  growi.minikube.local' to /etc/hosts"
echo "2. add 'growi.minikube.local' to browser proxy exclude"
echo "3. access http://growi.minikube.local/"
echo ""
