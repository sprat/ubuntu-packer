@echo off
if "%1" == "" (
    echo Usage: %0 name
    echo where name: ubuntu-server, xubuntu, ...
    goto :end
)

packer build -timestamp-ui -var-file=packer/%1.json packer/template.json

:end
