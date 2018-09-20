###########################################################################
# Minishift Installation on Mac
# 
# #### Mac Version: 10.12.6
# #### Homebrew version: Homebrew 1.7.4
# #### XHyve (Hypervisor) Version: xhyve: 0.2.0
# #### minishift version: minishift v1.23.0+91235ee
###########################################################################

echo "################ echoing arguments"
echo $1
echo "################ ENDED echoing arguments"
echo ""

brew_installed=""
xhyve_installed=""

if [ "$1" == "install-all" ] ; then 
    echo 'installing everything ...........'
    echo ""

    # Install Homebrew if not present
	brew_installed=$(command -v brew)

    if [ "$brew_installed" == "" ] ; then
    	echo "installing homebrew..."
    	echo ""
    	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  		brew_installed=$(command -v brew)

		echo "###############################"
		echo "Verify Brew Installed in below location"
		echo $brew_installed
		echo "###############################"
		echo ""
    else
    	echo "Brew is already installed"
    	echo ""
    fi
	# ENDING Install Homebrew 

    # Install Xhyve if not present
	xhyve_installed=$(command -v xhyve)

    if [ "$xhyve_installed" == "" ] ; then
    	echo "installing xhyve..."
    	echo ""
    	brew install xhyve
  		xhyve_installed=$(command -v brew)

		echo "###############################"
		echo "Verify Xhyve Installed in below location"
		echo $xhyve_installed
		echo "###############################"
		echo ""
    else
    	echo "Xhyve is already installed"
    	echo ""
    fi
	# ENDING Install Xhyve 

    # Install Hypervisor driver docker-machine-driver-xhyve if not present
	xhyve_driver_installed=$(command -v docker-machine-driver-xhyve)

    if [ "$xhyve_driver_installed" == "" ] ; then
    	echo "installing xhyve driver..."
    	echo ""
    	brew install docker-machine-driver-xhyve

    	echo "Setting up some permissions, PLEASE ENTER YOUR machine password that you use to login to this computer"
    	sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
    	sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
    	echo "set up complete"

  		xhyve_driver_installed=$(command -v docker-machine-driver-xhyve)

		echo "###############################"
		echo "Verify Xhyve Driver Installed in below location"
		echo $xhyve_driver_installed
		echo "###############################"
		echo ""
    else
    	echo "Xhyve Driver is already installed"
    	echo ""
    fi
	# ENDING Hypervisor driver docker-machine-driver-xhyve

    # Install minishift
	minishift_installed=$(command -v minishift)

    if [ "$minishift_installed" == "" ] ; then
    	echo "installing minishift..."
    	echo ""
    	brew cask install minishift

  		minishift_installed=$(command -v minishift)

		echo "###############################"
		echo "Verify minishift Installed in below location"
		echo $minishift_installed
		echo "###############################"
		echo ""
    else
    	echo "minishift is already installed"
    	echo ""
    fi
	# ENDING minishift installation

else	
	echo ""
	echo "VERIFYING Everything that is needed is already installed"

    if [ "$(command -v brew)" == "" ] ; then
    	echo "You need to install Homebrew, You could run this script with parameter install-all to install missing components like *** sh run-minishift.sh install-all ****"
    	return
    fi

    if [ "$(command -v xhyve)" == "" ] ; then
    	echo "You need to install XHyve, You could run this script with parameter install-all to install missing components like *** sh run-minishift.sh install-all ****"
    	return
    fi

    if [ "$(command -v docker-machine-driver-xhyve)" == "" ] ; then
    	echo "You need to install XHyve driver, You could run this script with parameter install-all to install missing components like *** sh run-minishift.sh install-all ****"
    	return
    fi

    if [ "$(command -v minishift)" == "" ] ; then
    	echo "You need to install minishift, You could run this script with parameter install-all to install missing components like *** sh run-minishift.sh install-all ****"
    	return
    fi

    echo ""
    echo "Looks like everything you need is installed"
    echo ""
fi

#Start minishift 
minishift start


