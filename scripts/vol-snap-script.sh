#!/bin/sh

namespace=$1
snapshotclass=$2

for pvc in $(kubectl get pvc -n $namespace | awk '{print $1}')
do

cat <<EOF | kubectl create -f -
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: ${pvc}-snapshot
  namespace: ${namespace}
spec:
  snapshotClassName: ${snapshotclass}
  source:
    name: ${pvc}
	kind: PersistentVolumeClaim
EOF

done	
