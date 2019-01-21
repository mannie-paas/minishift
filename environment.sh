# This path will need to change based on your local set up
echo 'Setting minishift env: There are a few sleeps, so it will take few minutes for this script to complete'
minishift oc-env export PATH="/Users/msah/.minishift/cache/oc/v3.10.0/darwin:$PATH" 
echo '$(minishift oc-env)'
eval $(minishift oc-env)

echo 'Sleeping for 60 seconds'
sleep 60

echo 'minishift docker-env export'
minishift docker-env export DOCKER_TLS_VERIFY="1" export DOCKER_HOST="tcp://$(minishift ip):2376" export DOCKER_CERT_PATH="/Users/msah/.minishift/certs"

echo '$(minishift docker-env)'
eval $(minishift docker-env)

echo 'Sleeping for 60 seconds'
sleep 60

echo 'OC USer Setup'
#oc login -u test-admin
oc login -u system:admin

#echo "User name is: 'developer'"
oc adm policy add-cluster-role-to-user cluster-admin developer --as=system:admin

oc login -u developer
oc new-project test-project
oc new-project dev-spring-project
oc new-project it-spring-project

echo $(minishift openshift registry)
echo 'printing docker info'
docker info 
echo 'ending printing docker info'

docker login -u $(oc whoami) -p $(oc whoami -t) $(minishift openshift registry)
