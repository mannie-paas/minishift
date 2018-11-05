# This path will need to change based on your local set up
#minishift oc-env export PATH="/Users/msah/.minishift/cache/oc/v3.10.0/darwin:$PATH" 
eval $(minishift oc-env)


sleep 60
#minishift docker-env export DOCKER_TLS_VERIFY="1" export DOCKER_HOST="tcp://192.168.64.2:2376" export DOCKER_CERT_PATH="/Users/msah/.minishift/certs"
eval $(minishift docker-env)

sleep 60
#oc login -u test-admin
oc login -u system:admin

oc adm policy add-cluster-role-to-user cluster-admin mini-admin --as=system:admin

oc login -u mini-admin
oc new-project test-project

echo $(minishift openshift registry)
docker info 


docker login -u $(oc whoami) -p $(oc whoami -t) $(minishift openshift registry)
