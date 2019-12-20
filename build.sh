#!/bin/bash

function build {
    # Remove previous binary packages
    rm -v dist/$1/*$2*

    # Build image
    cp -v script/build/Dockerfile     $1/build/
    cp -v script/keep-open.sh         $1/build/.keep-open.sh
    cp -v script/entrypoint.sh        $1/build/.entrypoint.sh
    cp -v script/build/snort.sh       $1/build/.snort.sh
    cp -v script/build/snort-extra.sh $1/build/.snort-extra.sh

    docker-compose -f $1/docker-compose.yml up --build $2-build

    rm -v $1/build/Dockerfile
    rm -v $1/build/.keep-open.sh
    rm -v $1/build/.entrypoint.sh
    rm -v $1/build/.snort.sh
    rm -v $1/build/.snort-extra.sh

    # Install image
    cp -v script/install/Dockerfile    $1/install
    cp -v script/keep-open.sh          $1/install/.keep-open.sh
    cp -v script/entrypoint.sh         $1/install/.entrypoint.sh
    cp -v script/install/test-snort.sh $1/install/.test-snort.sh

	docker-compose -f $1/docker-compose.yml up --build $2-install

    rm -v $1/install/Dockerfile
    rm -v $1/install/.keep-open.sh
    rm -v $1/install/.entrypoint.sh
    rm -v $1/install/.test-snort.sh
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
