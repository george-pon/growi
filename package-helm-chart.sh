#!/bin/bash
#
# build helm chart package
#

set -ex

mkdir -p ./helm-chart/charts
pushd ./helm-chart/charts
helm package ../growi
helm repo index  --url=https://raw.githubusercontent.com/george-pon/growi-helm-chart/master/helm-chart/charts/  .
popd

set +ex
