# vm-builder

## What I used:
* [packer](http://packer.io) 0.12.2
* [vagrant](http://vagrant.io) 1.9.1
* [virtualbox](http://virtualbox.org) 5.1.14
* vmware fusion 8.5.3

## Goals:
* automate build of golden image
* build development windows vm / docker host
* create reference architecture of building containers for hosting microservices

## Todo:
* Get docker host scripts written
* [vmware] Fix issue where vm tools don't always install
* [virtualbox] Write script to get tools installed - wintemplate chef recipe

## Build golden image:
* Download the windows 2016 ISO image to the ./iso-images folder
* Update the ./packer/2016-full.json file with the right path, checksum
* Run `packer build -force -only virtualbox-iso 2016-full.json` Note: This for specific provider, remove and both images are built in parallel

## Kitchen Testing
* Go to the cookbooks folder
* `kitchen create default-windows-2016` - this will use Vagrant and spin up a new box and connect it so that you can begin developing your new recipes. Note: Its set to use VMware. Change the `.kitchen.yml` if you want to change the driver.

### Notes:

Note: Due to a bug in the version of VMware tools shipped with 8.5.3 you will need to download the latest version of the tools. Download and update