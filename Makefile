.PHONY: all clean 
		debian stretch buster 
		fedora fc30 fc31 
		opensuse leap15.0 leap15.1 
		rasp rasp-stretch rasp-buster 
		ubuntu bionic eoan push

all:	debian fedora opensuse ubuntu

clean:
		cd dist && rm -rfv *
		touch .gitkeep


debian: 
		stretch buster

stretch:
		docker-compose -f debian/docker-compose.yml up --build stretch-build
		docker-compose -f debian/docker-compose.yml up --build stretch-install

buster:
		docker-compose -f debian/docker-compose.yml up --build buster-build
		docker-compose -f debian/docker-compose.yml up --build buster-install

fedora: 
		fc30 fc31

fc30:
		docker-compose -f fedora/docker-compose.yml up --build fc30-build
		docker-compose -f fedora/docker-compose.yml up --build fc30-install

fc31:	
		docker-compose -f fedora/docker-compose.yml up --build fc31-build		
		docker-compose -f fedora/docker-compose.yml up --build fc31-install

opensuse: 
		leap15.0 leap15.1

leap15.0:
		docker-compose -f opensuse/docker-compose.yml up --build leap15.0-build
		docker-compose -f opensuse/docker-compose.yml up --build leap15.0-install

leap15.1:
		docker-compose -f opensuse/docker-compose.yml up --build leap15.1-build
		docker-compose -f opensuse/docker-compose.yml up --build leap15.1-install

rasp: 
		rasp-stretch rasp-buster

rasp-stretch:
		docker-compose -f raspbian/docker-compose.yml up --build stretch-build
		docker-compose -f raspbian/docker-compose.yml up --build stretch-install

rasp-buster:
		docker-compose -f raspbian/docker-compose.yml up --build buster-build
		docker-compose -f raspbian/docker-compose.yml up --build buster-install

ubuntu: 
		bionic eoan

bionic: 
		docker-compose -f ubuntu/docker-compose.yml up --build bionic-build
		docker-compose -f ubuntu/docker-compose.yml up --build bionic-install

eoan:
		docker-compose -f ubuntu/docker-compose.yml up --build eoan-build
		docker-compose -f ubuntu/docker-compose.yml up --build eoan-install

push:
		docker-compose -f debian/docker-compose.yml push
		docker-compose -f fedora/docker-compose.yml push
		docker-compose -f opensuse/docker-compose.yml push
		docker-compose -f ubuntu/docker-compose.yml push
