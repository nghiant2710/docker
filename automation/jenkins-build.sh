#!/bin/bash
set -e

VERSION=$(<VERSION)

make cross

## ARM Build
mkdir -p docker-arm-$VERSION
rm -f docker-arm-$VERSION.tar
rm -f docker-arm*.tar.xz
rm -f docker-arm*.tar.gz

cp bundles/$VERSION/cross/linux/arm/docker-$VERSION docker-arm-$VERSION/docker
tar -cvzf docker-arm-$VERSION.tar.gz docker-arm-$VERSION && rm -rf docker-arm-$VERSION

## i386 Build
mkdir -p docker-386-$VERSION
rm -f docker-386-$VERSION.tar
rm -f docker-386*.tar.xz
rm -f docker-386*.tar.gz

cp bundles/$VERSION/cross/linux/386/docker-$VERSION docker-386-$VERSION/docker
tar -cvzf docker-386-$VERSION.tar.gz docker-386-$VERSION && rm -rf docker-386-$VERSION
