.PHONY: all clean push arm-push
		centos centos8
		debian stretch buster 
		fedora fc30 fc31 
		opensuse leap15.0 leap15.1 
		rasp rasp-stretch rasp-buster 
		ubuntu bionic eoan

#---------------------Common targets-----------------------------#

all:	centos debian fedora opensuse ubuntu

clean:
		cd dist
		rm -rfv * && touch .gitkeep

push:
		docker-compose -f centos/docker-compose.yml push
		docker-compose -f debian/docker-compose.yml push
		docker-compose -f fedora/docker-compose.yml push
		docker-compose -f opensuse/docker-compose.yml push
		docker-compose -f ubuntu/docker-compose.yml push

arm-push:
		docker-compose -f raspbian/docker-compose.yml push

#--------------------------CentOS--------------------------------#

centos: centos8

centos8: 
		./build.sh $@

#--------------------------Debian--------------------------------#

debian: stretch buster

stretch:
		./build.sh $@

buster:
		./build.sh $@

#--------------------------Fedora--------------------------------#

fedora: fc30 fc31

fc30:
		./build.sh $@

fc31:	
		./build.sh $@

#--------------------------OpenSUSE------------------------------#

opensuse: leap15.0 leap15.1

leap15.0:
		./build.sh $@

leap15.1:
		./build.sh $@

#--------------------------Raspbian------------------------------#

raspbian: rasp-stretch rasp-buster

raspbian-stretch:
		./build.sh $@

raspbian-buster:
		./build.sh $@

#--------------------------Ubuntu--------------------------------#

ubuntu: bionic eoan

bionic: 
		./build.sh $@

eoan:
		./build.sh $@
