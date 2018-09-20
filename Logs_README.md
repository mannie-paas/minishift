# minishift - Work in progress

Install Minishift on mac 
https://docs.okd.io/latest/minishift/getting-started/quickstart.html



* brew cask install minishift
https://docs.okd.io/latest/minishift/getting-started/installing.html

* start it 
minishift start
https://docs.okd.io/latest/minishift/getting-started/quickstart.html


NEEDS a Hypervisor:
https://docs.okd.io/latest/minishift/getting-started/setting-up-virtualization-environment.html#setting-up-xhyve-driver

brew install docker-machine-driver-xhyve

sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
Password: YOur machine password 

sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

INFO:
ICC11575:kubernetes-aws msah$ brew info --installed docker-machine-driver-xhyve
docker-machine-driver-xhyve: stable 0.3.3 (bottled), HEAD
Docker Machine driver for xhyve
https://github.com/zchee/docker-machine-driver-xhyve
/usr/local/Cellar/docker-machine-driver-xhyve/0.3.3 (3 files, 10.2MB) *
  Poured from bottle on 2018-09-14 at 14:14:12
From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/docker-machine-driver-xhyve.rb
==> Dependencies
Build: go ✘, ocaml ✘, opam ✘
Required: libev ✔
Recommended: docker-machine ✔
==> Requirements
Required: macOS >= 10.10 ✔
==> Options
--without-docker-machine
  Build without docker-machine support
--without-qcow2
  Do not support qcow2 disk image format
--HEAD
  Install HEAD version
==> Caveats
This driver requires superuser privileges to access the hypervisor. To
enable, execute
    sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
    sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
==> Analytics
install: 3515 (30d), 14821 (90d), 55970 (365d)
install_on_request: 3391 (30d), 13349 (90d), 51513 (365d)
build_error: 8 (30d)
ICC11575:kubernetes-aws msah$ 



NOW START MINISHIFT:

minishift start



ICC11575:~ msah$ minishift start
-- Starting profile 'minishift'
-- Check if deprecated options are used ... OK
-- Checking if https://github.com is reachable ... OK
-- Checking if requested OpenShift version 'v3.10.0' is valid ... OK
-- Checking if requested OpenShift version 'v3.10.0' is supported ... OK
-- Checking if requested hypervisor 'xhyve' is supported on this platform ... OK
-- Checking if xhyve driver is installed ... 
   Driver is available at /usr/local/bin/docker-machine-driver-xhyve
   Checking for setuid bit ... OK
-- Checking the ISO URL ... OK
-- Downloading OpenShift binary 'oc' version 'v3.10.0'
 23.67 MiB / 23.81 MiB [========================================================================================================================================================================]  99.41% 0s 23.81 MiB / 23.81 MiB [========================================================================================================================================================================] 100.00% 0sOK
-- Checking if provided oc flags are supported ... OK
-- Starting the OpenShift cluster using 'xhyve' hypervisor ...
-- Minishift VM will be configured with ...
   Memory:    4 GB
   vCPUs :    2
   Disk size: 20 GB

   Downloading ISO 'https://github.com/minishift/minishift-centos-iso/releases/download/v1.12.0/minishift-centos7.iso'
 344.00 MiB / 344.00 MiB [======================================================================================================================================================================] 100.00% 0s
-- Starting Minishift VM ..................... OK
-- Checking for IP address ... OK
-- Checking for nameservers ... OK
-- Checking if external host is reachable from the Minishift VM ... 
   Pinging 8.8.8.8 ... OK
-- Checking HTTP connectivity from the VM ... 
   Retrieving http://minishift.io/index.html ... OK
-- Checking if persistent storage volume is mounted ... OK
-- Checking available disk space ... 1% used OK
   Importing 'openshift/origin:v3.10.0' . CACHE MISS
   Importing 'openshift/origin-docker-registry:v3.10.0' . CACHE MISS
   Importing 'openshift/origin-haproxy-router:v3.10.0'  CACHE MISS
-- OpenShift cluster will be configured with ...
   Version: v3.10.0
-- Pulling the Openshift Container Image ................ OK
-- Copying oc binary from the OpenShift container image to VM ... OK
-- Starting OpenShift cluster .............................................

......
Getting a Docker client ...
Checking if image openshift/origin-control-plane:v3.10 is available ...
Pulling image openshift/origin-control-plane:v3.10
Image pull complete
Pulling image openshift/origin-cli:v3.10
Pulled 1/4 layers, 27% complete
Pulled 2/4 layers, 56% complete
Pulled 3/4 layers, 89% complete
Pulled 4/4 layers, 100% complete
Extracting
Image pull complete
Pulling image openshift/origin-node:v3.10
Pulled 5/6 layers, 85% complete
Pulled 6/6 layers, 100% complete
Extracting
Image pull complete
Checking type of volume mount ...
Determining server IP ...
Using public hostname IP 192.168.64.2 as the host IP
Checking if OpenShift is already running ...
Checking for supported Docker version (=>1.22) ...
Checking if insecured registry is configured properly in Docker ...
Checking if required ports are available ...
Checking if OpenShift client is configured properly ...
Checking if image openshift/origin-control-plane:v3.10 is available ...
Starting OpenShift using openshift/origin-control-plane:v3.10 ...
I0917 12:51:42.094288    2111 config.go:42] Running "create-master-config"
I0917 12:51:44.811629    2111 config.go:46] Running "create-node-config"
I0917 12:51:45.835359    2111 flags.go:30] Running "create-kubelet-flags"
I0917 12:51:46.364562    2111 run_kubelet.go:48] Running "start-kubelet"
I0917 12:51:46.495180    2111 run_self_hosted.go:172] Waiting for the kube-apiserver to be ready ...
I0917 12:52:33.501863    2111 interface.go:26] Installing "kube-proxy" ...
I0917 12:52:33.502481    2111 interface.go:26] Installing "kube-dns" ...
I0917 12:52:33.502489    2111 interface.go:26] Installing "openshift-apiserver" ...
I0917 12:52:33.502535    2111 apply_template.go:83] Installing "openshift-apiserver"
I0917 12:52:33.503360    2111 apply_template.go:83] Installing "kube-proxy"
I0917 12:52:33.504891    2111 apply_template.go:83] Installing "kube-dns"
I0917 12:52:35.718996    2111 interface.go:41] Finished installing "kube-proxy" "kube-dns" "openshift-apiserver"
I0917 12:53:22.758286    2111 run_self_hosted.go:224] openshift-apiserver available
I0917 12:53:22.758327    2111 interface.go:26] Installing "openshift-controller-manager" ...
I0917 12:53:22.758344    2111 apply_template.go:83] Installing "openshift-controller-manager"
I0917 12:53:25.231892    2111 interface.go:41] Finished installing "openshift-controller-manager"
Adding default OAuthClient redirect URIs ...
Adding router ...
Adding persistent-volumes ...
Adding registry ...
Adding sample-templates ...
Adding web-console ...
Adding centos-imagestreams ...
I0917 12:53:25.300453    2111 interface.go:26] Installing "openshift-router" ...
I0917 12:53:25.300462    2111 interface.go:26] Installing "persistent-volumes" ...
I0917 12:53:25.300467    2111 interface.go:26] Installing "openshift-image-registry" ...
I0917 12:53:25.300471    2111 interface.go:26] Installing "sample-templates" ...
I0917 12:53:25.300478    2111 interface.go:26] Installing "openshift-web-console-operator" ...
I0917 12:53:25.300482    2111 interface.go:26] Installing "centos-imagestreams" ...
I0917 12:53:25.300525    2111 apply_list.go:68] Installing "centos-imagestreams"
I0917 12:53:25.301466    2111 interface.go:26] Installing "sample-templates/mariadb" ...
I0917 12:53:25.301474    2111 interface.go:26] Installing "sample-templates/mysql" ...
I0917 12:53:25.301478    2111 interface.go:26] Installing "sample-templates/rails quickstart" ...
I0917 12:53:25.301484    2111 interface.go:26] Installing "sample-templates/jenkins pipeline ephemeral" ...
I0917 12:53:25.301488    2111 interface.go:26] Installing "sample-templates/sample pipeline" ...
I0917 12:53:25.301492    2111 interface.go:26] Installing "sample-templates/mongodb" ...
I0917 12:53:25.301496    2111 interface.go:26] Installing "sample-templates/cakephp quickstart" ...
I0917 12:53:25.301502    2111 interface.go:26] Installing "sample-templates/dancer quickstart" ...
I0917 12:53:25.301507    2111 interface.go:26] Installing "sample-templates/django quickstart" ...
I0917 12:53:25.301511    2111 interface.go:26] Installing "sample-templates/nodejs quickstart" ...
I0917 12:53:25.301515    2111 interface.go:26] Installing "sample-templates/postgresql" ...
I0917 12:53:25.301546    2111 apply_list.go:68] Installing "sample-templates/postgresql"
I0917 12:53:25.306579    2111 apply_template.go:83] Installing "openshift-web-console-operator"
I0917 12:53:25.313017    2111 apply_list.go:68] Installing "sample-templates/mongodb"
I0917 12:53:25.313240    2111 apply_list.go:68] Installing "sample-templates/mariadb"
I0917 12:53:25.313442    2111 apply_list.go:68] Installing "sample-templates/mysql"
I0917 12:53:25.313623    2111 apply_list.go:68] Installing "sample-templates/rails quickstart"
I0917 12:53:25.313782    2111 apply_list.go:68] Installing "sample-templates/jenkins pipeline ephemeral"
I0917 12:53:25.313967    2111 apply_list.go:68] Installing "sample-templates/sample pipeline"
I0917 12:53:25.314353    2111 apply_list.go:68] Installing "sample-templates/django quickstart"
I0917 12:53:25.314541    2111 apply_list.go:68] Installing "sample-templates/cakephp quickstart"
I0917 12:53:25.314738    2111 apply_list.go:68] Installing "sample-templates/dancer quickstart"
I0917 12:53:25.315068    2111 apply_list.go:68] Installing "sample-templates/nodejs quickstart"
I0917 12:53:35.867963    2111 interface.go:41] Finished installing "sample-templates/mariadb" "sample-templates/mysql" "sample-templates/rails quickstart" "sample-templates/jenkins pipeline ephemeral" "sample-templates/sample pipeline" "sample-templates/mongodb" "sample-templates/cakephp quickstart" "sample-templates/dancer quickstart" "sample-templates/django quickstart" "sample-templates/nodejs quickstart" "sample-templates/postgresql"
I0917 12:54:20.877934    2111 interface.go:41] Finished installing "openshift-router" "persistent-volumes" "openshift-image-registry" "sample-templates" "openshift-web-console-operator" "centos-imagestreams"
Login to server ...
Creating initial project "myproject" ...
Server Information ...
OpenShift server started.

The server is accessible via web console at:
    https://192.168.64.2:8443

You are logged in as:
    User:     developer
    Password: <any value>

To login as administrator:
    oc login -u system:admin


-- Exporting of OpenShift images is occuring in background process with pid 2288.
ICC11575:~ msah$ 





## Use minishift oc-env to display the command you need to type into your shell in order to add the oc binary to your PATH environment variable. The output of oc-env will differ depending on OS and shell type.

ICC11575:~ msah$ minishift oc-env
export PATH="/Users/msah/.minishift/cache/oc/v3.10.0/darwin:$PATH"
# Run this command to configure your shell:
# eval $(minishift oc-env)
ICC11575:~ msah$ 


ICC11575:~ msah$ export PATH="/Users/msah/.minishift/cache/oc/v3.10.0/darwin:$PATH"
ICC11575:~ msah$ eval $(minishift oc-env)
ICC11575:~ msah$ 


ICC11575:~ msah$ oc login -u system:admin
Logged into "https://192.168.64.2:8443" as "system:admin" using existing credentials.

You have access to the following projects and can switch between them with 'oc project <projectname>':

    default
    kube-dns
    kube-proxy
    kube-public
    kube-system
  * myproject
    openshift
    openshift-apiserver
    openshift-controller-manager
    openshift-core-operators
    openshift-infra
    openshift-node
    openshift-web-console

Using project "myproject".
ICC11575:~ msah$ oc get pods
No resources found.
ICC11575:~ msah$ oc project default
Now using project "default" on server "https://192.168.64.2:8443".
ICC11575:~ msah$ oc get pods
NAME                            READY     STATUS      RESTARTS   AGE
docker-registry-1-t2rqp         1/1       Running     0          5m
persistent-volume-setup-m4mnq   0/1       Completed   0          5m
router-1-5rcp9                  1/1       Running     0          5m
ICC11575:~ msah$ 



## ADD SAmple project

ICC11575:~ msah$ oc project test-project
Now using project "test-project" on server "https://192.168.64.2:8443".
ICC11575:~ msah$ oc new-app https://github.com/openshift/nodejs-ex -l name=nodejs-ex-app
--> Found image 64934ad (7 days old) in image stream "openshift/nodejs" under tag "8" for "nodejs"

    Node.js 8 
    --------- 
    Node.js 8 available as container is a base platform for building and running various Node.js 8 applications and frameworks. Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.

    Tags: builder, nodejs, nodejs8

    * The source repository appears to match: nodejs
    * A source build using source code from https://github.com/openshift/nodejs-ex will be created
      * The resulting image will be pushed to image stream "nodejs-ex:latest"
      * Use 'start-build' to trigger a new build
    * This image will be deployed in deployment config "nodejs-ex"
    * Port 8080/tcp will be load balanced by service "nodejs-ex"
      * Other containers can access this service through the hostname "nodejs-ex"

--> Creating resources with label name=nodejs-ex-app ...
    imagestream "nodejs-ex" created
    buildconfig "nodejs-ex" created
    deploymentconfig "nodejs-ex" created
    service "nodejs-ex" created
--> Success
    Build scheduled, use 'oc logs -f bc/nodejs-ex' to track its progress.
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/nodejs-ex' 
    Run 'oc status' to view your app.
ICC11575:~ msah$ oc expose svc/nodejs-ex
route "nodejs-ex" exposed
ICC11575:~ msah$ 


minishift openshift service nodejs-ex --in-browser


oc adm policy add-cluster-role-to-user cluster-admin mandeep --as=system:admin

anypassword




# Minishift Docker daemon

https://docs.okd.io/latest/minishift/using/docker-daemon.html

ICC11575:~ msah$ minishift docker-env
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.64.2:2376"
export DOCKER_CERT_PATH="/Users/msah/.minishift/certs"
# Run this command to configure your shell:
# eval $(minishift docker-env)
ICC11575:~ msah$ export DOCKER_TLS_VERIFY="1"
ICC11575:~ msah$ export DOCKER_HOST="tcp://192.168.64.2:2376"
ICC11575:~ msah$ export DOCKER_CERT_PATH="/Users/msah/.minishift/certs"
ICC11575:~ msah$ 


ICC11575:~ msah$ docker ps
CONTAINER ID        IMAGE                                    COMMAND                  CREATED             STATUS              PORTS               NAMES
610ddb7b42db        172.30.1.1:5000/test-project/nodejs-ex   "container-entrypo..."   4 hours ago         Up 3 hours                              k8s_nodejs-ex_nodejs-ex-1-tccrj_test-project_e9007427-baa3-11e8-b01b-3efec07c78b1_0
f28c7cec449a        openshift/origin-pod:v3.10               "/usr/bin/pod"           4 hours ago         Up 3 hours                              k8s_POD_nodejs-ex-1-tccrj_test-project_e9007427-baa3-11e8-b01b-3efec07c78b1_0
61e36483c8ce        7098d8b0a928                             "/usr/bin/origin-w..."   5 hours ago         Up 4 hours                              k8s_webconsole_webconsole-746df7fd47-xmgz7_openshift-web-console_540713aa-ba9a-11e8-b01b-3efec07c78b1_0
d1b2118c4eff        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_webconsole-746df7fd47-xmgz7_openshift-web-console_540713aa-ba9a-11e8-b01b-3efec07c78b1_0
6b6e325ca6a1        openshift/origin-haproxy-router          "/usr/bin/openshif..."   5 hours ago         Up 4 hours                              k8s_router_router-1-5rcp9_default_3bbaed1b-ba9a-11e8-b01b-3efec07c78b1_0
709a17e88af7        openshift/origin-docker-registry         "/bin/sh -c '/usr/..."   5 hours ago         Up 4 hours                              k8s_registry_docker-registry-1-t2rqp_default_3bb80fe8-ba9a-11e8-b01b-3efec07c78b1_0
3a1b889a7acc        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_router-1-5rcp9_default_3bbaed1b-ba9a-11e8-b01b-3efec07c78b1_0
37e06431432e        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_docker-registry-1-t2rqp_default_3bb80fe8-ba9a-11e8-b01b-3efec07c78b1_0
449f282e8d99        openshift/origin-hypershift              "hypershift experi..."   5 hours ago         Up 4 hours                              k8s_operator_openshift-web-console-operator-78ddf7cbb7-j8btj_openshift-core-operators_39364de6-ba9a-11e8-b01b-3efec07c78b1_0
528945aee504        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_openshift-web-console-operator-78ddf7cbb7-j8btj_openshift-core-operators_39364de6-ba9a-11e8-b01b-3efec07c78b1_0
d79829936f99        openshift/origin-hypershift              "hypershift opensh..."   5 hours ago         Up 4 hours                              k8s_c_openshift-controller-manager-87lp2_openshift-controller-manager_31f87295-ba9a-11e8-b01b-3efec07c78b1_0
fd575adbd90a        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_openshift-controller-manager-87lp2_openshift-controller-manager_31f87295-ba9a-11e8-b01b-3efec07c78b1_0
2829422311c5        openshift/origin-control-plane           "openshift start n..."   5 hours ago         Up 4 hours                              k8s_kube-proxy_kube-dns-5rgct_kube-dns_15ab9826-ba9a-11e8-b01b-3efec07c78b1_0
41e3879baed7        openshift/origin-hypershift              "hypershift opensh..."   5 hours ago         Up 4 hours                              k8s_apiserver_openshift-apiserver-tjt9g_openshift-apiserver_15b4fc9d-ba9a-11e8-b01b-3efec07c78b1_0
d1ac803624b1        openshift/origin-control-plane           "openshift start n..."   5 hours ago         Up 4 hours                              k8s_kube-proxy_kube-proxy-6mfmj_kube-proxy_15aba90b-ba9a-11e8-b01b-3efec07c78b1_0
52a7239c9163        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_openshift-apiserver-tjt9g_openshift-apiserver_15b4fc9d-ba9a-11e8-b01b-3efec07c78b1_0
c715dc03cd7e        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_kube-dns-5rgct_kube-dns_15ab9826-ba9a-11e8-b01b-3efec07c78b1_0
78b32122b03b        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_kube-proxy-6mfmj_kube-proxy_15aba90b-ba9a-11e8-b01b-3efec07c78b1_0
0f8bdd9401bc        openshift/origin-hyperkube               "hyperkube kube-co..."   5 hours ago         Up 4 hours                              k8s_controllers_kube-controller-manager-localhost_kube-system_cf07c257e59480321fdeb259a67fa38f_0
fe5cc6b8c79f        openshift/origin-control-plane           "/bin/bash -c '#!/..."   5 hours ago         Up 4 hours                              k8s_etcd_master-etcd-localhost_kube-system_a9bdaba759b3da782fe55b6a40fb54ee_0
4c7cddc923e7        openshift/origin-hypershift              "/bin/bash -c '#!/..."   5 hours ago         Up 4 hours                              k8s_api_master-api-localhost_kube-system_9da45f1cf2577695bf6d813e77d9fb24_0
30fd7f18103d        openshift/origin-hyperkube               "hyperkube kube-sc..."   5 hours ago         Up 4 hours                              k8s_scheduler_kube-scheduler-localhost_kube-system_244d3b4e9061f1d3122ddc3399b032b3_0
ca1c9a10575d        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_master-api-localhost_kube-system_9da45f1cf2577695bf6d813e77d9fb24_0
f0bfb1a70ac4        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_kube-scheduler-localhost_kube-system_244d3b4e9061f1d3122ddc3399b032b3_0
7510ea14f7bd        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_master-etcd-localhost_kube-system_a9bdaba759b3da782fe55b6a40fb54ee_0
077a7f680fed        openshift/origin-pod:v3.10               "/usr/bin/pod"           5 hours ago         Up 4 hours                              k8s_POD_kube-controller-manager-localhost_kube-system_cf07c257e59480321fdeb259a67fa38f_0
cec3d3fad35f        openshift/origin-node:v3.10              "hyperkube kubelet..."   5 hours ago         Up 4 hours                              origin
ICC11575:~ msah$ 



# GET THE MINISHIFT DOCKER REGISTRY

minishift openshift registry

ICC11575:~ msah$ minishift openshift registry
172.30.1.1:5000
ICC11575:~ msah$ 


# LOGIN TO DOCKER REGISTRY of MINISHIFT

docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)


ICC11575:~ msah$ docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)
error: no token is currently in use for this session
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
Error response from daemon: Get https://registry-1.docker.io/v2/: unauthorized: incorrect username or password
ICC11575:~ msah$ oc whoami -t
error: no token is currently in use for this session
ICC11575:~ msah$ oc whoami
system:admin
ICC11575:~ msah$ 


ICC11575:~ msah$ oc whoami
mandeep
ICC11575:~ msah$ oc whoami -t
gdbyymdSQG1_57iIjNzApUIH-i0OuNz5CldRrkz6_fo
ICC11575:~ msah$ 


ICC11575:~ msah$ docker login -u developer -p $(oc whoami -t) $(minishift openshift registry)
WARNING! Using --password via the CLI is insecure. Use --password-stdin.
Login Succeeded
ICC11575:~ msah$ 



ICC11575:~ msah$ cd Documents/Workspaces/minishift-sample-app/
ICC11575:minishift-sample-app msah$ docker build . -t springboot:sample
unable to prepare context: unable to evaluate symlinks in Dockerfile path: lstat /Users/msah/Documents/Workspaces/minishift-sample-app/Dockerfile: no such file or directory
ICC11575:minishift-sample-app msah$ ls
RemoteSystemsTempFiles  sample-springboot
ICC11575:minishift-sample-app msah$ cd sample-springboot/
ICC11575:sample-springboot msah$ docker build . -t springboot:sample
Sending build context to Docker daemon   16.3MB
Step 1/5 : FROM openjdk:8-jdk-alpine
Trying to pull repository docker.io/library/openjdk ... 
8-jdk-alpine: Pulling from docker.io/library/openjdk
4fe2ade4980c: Pull complete 
6fc58a8d4ae4: Pull complete 
fe815adf554b: Pull complete 
Digest: sha256:a2d7b02891b158d01523e26ad069d40d5eb2c14d6943cf4df969b097acaa77d3
Status: Downloaded newer image for docker.io/openjdk:8-jdk-alpine
 ---> 54ae553cb104
Step 2/5 : EXPOSE 8080
 ---> Running in ec0823540572
 ---> df312f39e79c
Removing intermediate container ec0823540572
Step 3/5 : ARG JAR_FILE=target/websocket-demo-0.0.1-SNAPSHOT.jar
 ---> Running in c69b85822434
 ---> 632f6a253416
Removing intermediate container c69b85822434
Step 4/5 : ADD target/sample-springboot.jar /sample-springboot.jar
 ---> 9acf0c189c8b
Removing intermediate container 3bbeab9bb01c
Step 5/5 : ENTRYPOINT java -jar /sample-springboot.jar
 ---> Running in f948eceb9d35
 ---> d9683650544a
Removing intermediate container f948eceb9d35
Successfully built d9683650544a
ICC11575:sample-springboot msah$ pwd
/Users/msah/Documents/Workspaces/minishift-sample-app/sample-springboot
ICC11575:sample-springboot msah$ 


# Deploying image to openshift:

ICC11575:sample-springboot msah$ docker tag springboot:sample $(minishift openshift registry)/test-project/springboot:dev
ICC11575:sample-springboot msah$ docker push $(minishift openshift registry)/test-project/springboot:dev
The push refers to a repository [172.30.1.1:5000/test-project/springboot]
6becb5ec094d: Pushed 
f2ec1bba02a6: Pushed 
0c3170905795: Pushed 
df64d3292fd6: Pushed 
dev: digest: sha256:6ed5d64052fc65aa883e99dc5962839fbc0b7bd47848ca39dacfaf3369f966b1 size: 1159
ICC11575:sample-springboot msah$ 



# Create a new App 

ICC11575:sample-springboot msah$ oc new-app --image-stream=springboot --name=springboot
error: unable to locate any images in image streams with name "springboot"

The 'oc new-app' command will match arguments to the following types:

  1. Images tagged into image streams in the current project or the 'openshift' project
     - if you don't specify a tag, we'll add ':latest'
  2. Images in the Docker Hub, on remote registries, or on the local Docker engine
  3. Templates in the current project or the 'openshift' project
  4. Git repository URLs or local paths that point to Git repositories

--allow-missing-images can be used to point to an image that does not exist yet.

See 'oc new-app -h' for examples.
ICC11575:sample-springboot msah$ oc project test-project
Now using project "test-project" on server "https://192.168.64.2:8443".
ICC11575:sample-springboot msah$ oc new-app --image-stream=springboot --name=springboot
error: only a partial match was found for "springboot": "test-project/springboot:dev"

The argument "springboot" only partially matched the following Docker image, OpenShift image stream, or template:

* Image stream "springboot" (tag "dev") in project "test-project"
  Use --image-stream="test-project/springboot:dev" to specify this image or template

ICC11575:sample-springboot msah$ oc new-app --image-stream=springboot:dev --name=springboot
--> Found image d968365 (21 minutes old) in image stream "test-project/springboot" under tag "dev" for "springboot:dev"

    * This image will be deployed in deployment config "springboot"
    * Port 8080/tcp will be load balanced by service "springboot"
      * Other containers can access this service through the hostname "springboot"
    * WARNING: Image "test-project/springboot:dev" runs as the 'root' user which may not be permitted by your cluster administrator

--> Creating resources ...
    deploymentconfig "springboot" created
    service "springboot" created
--> Success
    Application is not exposed. You can expose services to the outside world by executing one or more of the commands below:
     'oc expose svc/springboot' 
    Run 'oc status' to view your app.
ICC11575:sample-springboot msah$ 
ICC11575:sample-springboot msah$ 
ICC11575:sample-springboot msah$ 


# Verify app

ICC11575:sample-springboot msah$ oc get pods
NAME                 READY     STATUS      RESTARTS   AGE
nodejs-ex-1-build    0/1       Completed   0          4h
nodejs-ex-1-tccrj    1/1       Running     0          4h
springboot-1-bznpc   1/1       Running     0          20m
ICC11575:sample-springboot msah$ oc get dc
NAME         REVISION   DESIRED   CURRENT   TRIGGERED BY
nodejs-ex    1          1         1         config,image(nodejs-ex:latest)
springboot   1          1         1         config,image(springboot:dev)
ICC11575:sample-springboot msah$ oc get service
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
nodejs-ex    ClusterIP   172.30.140.106   <none>        8080/TCP   4h
springboot   ClusterIP   172.30.191.68    <none>        8080/TCP   20m
ICC11575:sample-springboot msah$ 


# Expose usign Route

ICC11575:sample-springboot msah$ oc expose service springboot
route "springboot" exposed
ICC11575:sample-springboot msah$ 

# verify route

ICC11575:sample-springboot msah$ oc get routes
NAME         HOST/PORT                                     PATH      SERVICES     PORT       TERMINATION   WILDCARD
nodejs-ex    nodejs-ex-test-project.192.168.64.2.nip.io              nodejs-ex    8080-tcp                 None
springboot   springboot-test-project.192.168.64.2.nip.io             springboot   8080-tcp                 None
ICC11575:sample-springboot msah$ 


URL is acccesible:
http://springboot-test-project.192.168.64.2.nip.io/