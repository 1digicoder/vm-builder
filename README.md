# vm-builder

## What I used:
* [packer](http://packer.io) 0.12.2
* [vagrant](http://vagrant.io) 1.9.1
* [virtualbox](http://virtualbox.org) 5.1.14
* [chocolatey](http://chocolatey.org)
* [vmware fusion](http://www.vmware.com/products/fusion.html) 8.5.3
* [vagrant-vmware plugin](https://www.vagrantup.com/vmware/) 4.0.18

## Goals:
* automate build of golden image
* build development windows vm / docker host
* create reference architecture of building containers for hosting microservices

## Lessons Learned:
* coordination between dsc, powershell, and chef is tricky
* There is an order that things must be done. Enable/Disable Features, Remove anything not turned on, Windows Update, Final Clean, package
* Windows Server SKUs puts network into Public and locks down ports. This require ports opened so that Packer can communicate with the VM via WinRM to automate the given tasks
* Chef runs in non-elevated process, so only certain tasks can happen here
* Packer allows you to elevate powershell processes on demand, so best suited for enabling/disabling windows features

## Build golden image:
* Download the windows 2016 ISO image to the ./iso-images folder
* Update the ./packer/2016-full.json file with the right path, checksum
* Run `packer build -force -only virtualbox-iso 2016-full.json` Note: This for specific provider, remove and both images are built in parallel

## Use Chocolatey repository for installing useful software
* This is a base image, for extra useful software, Chocolatey is preinstalled.

### Examples
`cinst googlechrome`
`cinst notepadplusplus`


## Kitchen Testing
* Go to the cookbooks folder
* `kitchen create default-windows-2016` - this will use Vagrant and spin up a new box and connect it so that you can begin developing your new recipes. Note: Its set to use VMware. Change the `.kitchen.yml` if you want to change the driver.

### Notes:

* Virtualbox does not support nested paging, so you cannot use it for Docker + Hyper-V for using Linux containers
* VMware does work, and so for those images, you can use Linux containers

Note: Due to a bug in the version of VMware tools shipped with 8.5.3 you will need to download the latest version of the tools. Download and update