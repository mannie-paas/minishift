# minishift - Work in progress

Install Minishift on mac 

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



