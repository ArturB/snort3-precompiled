.PHONY: all build clean push raspbian-push
		centos centos8
		debian stretch buster
		fedora fc30 fc31
		opensuse leap15.0 leap15.1
		rasp rasp-stretch rasp-buster
		ubuntu bionic eoan

#---------------------Common targets-----------------------------#

all:	centos debian fedora opensuse ubuntu

build:
		# Remove previous binary packages
		rm -fv dist/${DIST_NAME}/*${DIST_VERSION}*
		# Build image
		docker-compose -f $(DIST_NAME)/docker-compose.yml up --build $(DIST_VERSION)-build
		# Install image
		docker-compose -f $(DIST_NAME)/docker-compose.yml up --build $(DIST_VERSION)-install

clean:
		cd dist
		rm -rfv * && touch .gitkeep

push:
		docker-compose -f centos/docker-compose.yml push
		docker-compose -f debian/docker-compose.yml push
		docker-compose -f fedora/docker-compose.yml push
		docker-compose -f opensuse/docker-compose.yml push
		docker-compose -f ubuntu/docker-compose.yml push

raspbian-push:
		docker-compose -f raspbian/docker-compose.yml push

#--------------------------CentOS--------------------------------#

centos: el8

el8:
		$(MAKE) build DIST_NAME=centos DIST_VERSION=el8

#--------------------------Debian--------------------------------#

debian: stretch buster

stretch:
		$(MAKE) build DIST_NAME=debian DIST_VERSION=stretch

buster:
		$(MAKE) build DIST_NAME=debian DIST_VERSION=buster

#--------------------------Fedora--------------------------------#

fedora: fc30 fc31

fc30:
		$(MAKE) build DIST_NAME=fedora DIST_VERSION=fc30

fc31:
		$(MAKE) build DIST_NAME=fedora DIST_VERSION=fc31

#--------------------------Generic-------------------------------#

generic: x86_64

x86_64:
		$(MAKE) build DIST_NAME=generic DIST_VERSION=x86_64

#--------------------------OpenSUSE------------------------------#

opensuse: leap15.0 leap15.1

leap15.0:
		$(MAKE) build DIST_NAME=opensuse DIST_VERSION=leap15.0

leap15.1:
		$(MAKE) build DIST_NAME=opensuse DIST_VERSION=leap15.1

#--------------------------Raspbian------------------------------#

raspbian: raspbian-stretch raspbian-buster

raspbian-stretch:
		$(MAKE) build DIST_NAME=raspbian DIST_VERSION=stretch

raspbian-buster:
		$(MAKE) build DIST_NAME=raspbian DIST_VERSION=buster

#--------------------------Ubuntu--------------------------------#

ubuntu: bionic eoan

bionic:
		$(MAKE) build DIST_NAME=ubuntu DIST_VERSION=bionic

eoan:
		$(MAKE) build DIST_NAME=ubuntu DIST_VERSION=eoan
