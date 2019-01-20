#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 name"
    echo "where name: xubuntu | ..."
    exit 1
fi

packer build -var-file packer/$1.json packer/template.json
