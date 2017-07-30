#!/bin/bash

CHARTS_DIR=`pwd`/charts
cd /tmp
git clone git@github.com:syunkitada/openstack-helm.git

cd $CHARTS_DIR

for chart in `find /tmp/openstack-helm/ -name Chart.yaml | sed -e 's/Chart.yaml//g'`
do
    helm package $chart
done

helm repo index ./

rm -rf /tmp/openstack-helm
