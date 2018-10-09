#New NODE APP
oc new-app https://github.com/openshift/nodejs-ex -l name=nodejs-ex-app

oc expose svc/nodejs-ex

echo ""
echo "MINISHIFT REGISTRY IS:"
minishift openshift registry


#NEW SPRING BOOT APP 
cd samples/sample-springboot/ && mvn clean package

docker build . -t $(minishift openshift registry)/test-project/springboot:dev

docker images | grep sample-springboot

docker push $(minishift openshift registry)/test-project/springboot:dev

oc project test-project

oc new-app --image-stream=springboot:dev --name=springboot

oc expose service springboot

oc get pods

oc get routes
