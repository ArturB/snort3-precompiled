#!/bin/bash

function build {
    # Remove previous binary packages
    rm -v dist/$1/*$2*
    # Build image
    docker-compose -f $1/docker-compose.yml up --build $2-build
    # Install image
	docker-compose -f $1/docker-compose.yml up --build $2-install
}

case $1 in

    centos)
        build centos centos8
    ;;
    centos8) build centos centos8 ;;

    debian)
        build debian stretch
        build debian buster
    ;;
    stretch) build debian stretch ;;
    buster)  build debian buster ;;

    fedora)
        build fedora fc30
        build fedora fc31
    ;;
    fc30) build fedora fc30 ;;
    fc31) build fedora fc31 ;;

    opensuse)
        build opensuse leap15.0
        build opensuse leap15.1
    ;;
    leap15.0) build opensuse leap15.0 ;;
    leap15.1) build opensuse leap15.1 ;;

    raspbian)
        build raspbian stretch
        build raspbian buster
    ;;
    raspbian-stretch) build raspbian stretch ;;
    raspbian-buster)  build raspbian buster ;;

    ubuntu)
        build ubuntu bionic
        build ubuntu eoan
    ;;
    bionic) build ubuntu bionic ;;
    eoan)   build ubuntu eoan ;;

esac
