# Running Minishift on Mac

Reference documentation is available at: 
https://docs.okd.io/latest/minishift/getting-started/quickstart.html


DELETE AT THE END:

`
minishift delete --clear-cache
`

# Shortcut to installing everything manually 
Run the script here with install-all

`
sh run-minishift.sh install-all
`

# install homebrew

`
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)
`

# Install Xhyve - Hypervisor needed for minishift 
Other options available are: 
* Virtual Box

`
brew install xhyve
`

# Install Xhyve driver 

`
brew install docker-machine-driver-xhyve
`

Setup Driver: 
sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

This will ask for password of your machine.

# Start minishift

This will take a little bit of time. it took about 15 min for me.

`
minishfit start
`

with verbose: "--show-libmachine-logs -v 5"

If everything was successful, the final output would be something like below.

`
The server is accessible via web console at:
    https://192.168.64.2:8443

You are logged in as:
    User:     developer
    Password: <any value>

To login as administrator:
    oc login -u system:admin


-- Exporting of OpenShift images is occuring in background process with pid 2288.
`


# MANUAL STEPS

## Use minishift oc-env to display the command you need to type into your shell in order to add the oc binary to your PATH environment variable. The output of oc-env will differ depending on OS and shell type.

`
ICC11575:~ msah$ minishift oc-env
export PATH="/Users/msah/.minishift/cache/oc/v3.10.0/darwin:$PATH"
# Run this command to configure your shell:
# eval $(minishift oc-env)
ICC11575:~ msah$ 

ICC11575:~ msah$ export PATH="/Users/msah/.minishift/cache/oc/v3.10.0/darwin:$PATH"
ICC11575:~ msah$ eval $(minishift oc-env)

`


# Login to Openshift

`
oc login -u system:admin
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
`

# Viewing Web console
`
minishift console
`

or Use the URL it gave in logs: https://192.168.64.2:8443
You can log in with any user. For this example, we will use admin as the user name and give this user admin privileges.


# ADD DOCKER DAEMON

https://docs.okd.io/latest/minishift/using/docker-daemon.html

`

ICC11575:~ msah$ minishift docker-env
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.64.2:2376"
export DOCKER_CERT_PATH="/Users/msah/.minishift/certs"
# Run this command to configure your shell:
# eval $(minishift docker-env)
ICC11575:~ msah$ export DOCKER_TLS_VERIFY="1"
ICC11575:~ msah$ export DOCKER_HOST="tcp://192.168.64.2:2376"
ICC11575:~ msah$ export DOCKER_CERT_PATH="/Users/msah/.minishift/certs"
`

Now we should be able to give command `docker ps` to view the docker containers running for minishift.

# Viewing Things

ADDD SOMETHING HERE

# Adding a new project and app 

Shortcut: Run the create-sample.sh




# View specific project 

`
oc project <project-name>
`

# Viewing pods 

`
oc get pods
`


# Create a new project

`
oc new-project <project-name>
`




