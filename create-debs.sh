#!/bin/sh

# = Go to  the directory this script is in =

cd $(dirname "$0")

# = Create debs for each of the folders =

for directory in */ ; do
    [ -L "${directory%/}" ] && continue
    dpkg-deb --build --root-owner-group "$directory"
done

# = Move debs to debs folder =

mkdir debs

for debFile in *.deb ; do
    [ -L "${debFile%/}" ] && continue
    mv "$debFile" ./debs
done