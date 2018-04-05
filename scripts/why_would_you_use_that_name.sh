#!/bin/bash

extension='eml'
counter=1

# Skip right over the names, use the inodes
for f in $(find . -type f -exec stat {} \; | egrep -o 'Inode: [0-9]*' | awk {'print $2'}) ;
do
	mv $f ${counter}.${extension} && counter=$((${counter}+1))
done &&  echo "moved $((${counter}-1))done files"