oc login -u test-admin
oc login -u system:admin

oc adm policy add-cluster-role-to-user cluster-admin test-admin --as=system:admin

oc login -u test-admin
oc create project test-project

oc new-app https://github.com/openshift/nodejs-ex -l name=nodejs-ex-app

oc expose svc/nodejs-ex

echo ""
echo "MINISHIFT REGISTRY IS:"
minishift openshift registry


