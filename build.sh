#!/bin/bash

git submodule update

cd chartrepo

for chart in `find ../openstack-helm/ -name Chart.yaml | sed -e 's/Chart.yaml//g'`
do
    helm package $chart
done

helm repo index ./
