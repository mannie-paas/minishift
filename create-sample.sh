#Set the environment again
eval $(minishift oc-env)

eval $(minishift docker-env)
docker login -u $(oc whoami) -p $(oc whoami -t) $(minishift openshift registry)

#New NODE APP
oc new-app https://github.com/openshift/nodejs-ex -l name=nodejs-ex-app

oc expose svc/nodejs-ex

echo ""
echo "MINISHIFT REGISTRY IS:"
minishift openshift registry


#NEW SPRING BOOT APP 
cd samples/sample-springboot/ && mvn clean package

docker build . -t $(minishift openshift registry)/dev-spring-project/springboot:dev

docker images | grep springboot

docker push $(minishift openshift registry)/dev-spring-project/springboot:dev

oc project dev-spring-project

oc new-app --image-stream=springboot:dev --name=springboot

oc expose service springboot

oc get pods

oc get routes

echo "Starting IT SETUP"
docker tag $(minishift openshift registry)/dev-spring-project/springboot:dev $(minishift openshift registry)/it-spring-project/springboot:it

docker push $(minishift openshift registry)/it-spring-project/springboot:it
oc project it-spring-project
oc new-app --image-stream=springboot:it --name=springboot

oc expose service springboot