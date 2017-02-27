# vm-builder

What I used:
* [packer](http://packer.io) 0.12.2
* [vagrant](http://vagrant.io) 1.9.1
* [virtualbox](http://virtualbox.org) 5.1.14
* vmware fusion 8.5.3

Goals:
* automate build of golden image
* build development windows vm / docker host
* create reference architecture of building containers for hosting microservices


Todo:
* Get kitchen working to properly test the tasks past creating the golden image
* Get docker host scripts written
* [vmware] Fix issue where vm tools don't always install
* [virtualbox] Write script to get tools installed - wintemplate chef recipe

Build golden image:
* Download the windows 2016 ISO image to the ./iso-images folder
* Update the ./packer/2016-full.json file with the right path, checksum
* Run [packer build -force -only virtualbox-iso 2016-full.json]