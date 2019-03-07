@echo off
if "%1" == "" (
    echo Usage: %0 name
    echo where name: ubuntu-server, xubuntu, ...
    goto :end
)

rem You may encounter 416 HTTP errors: please delete the packer_cache when it
rem happens. It should be solved in packer version 1.3.5, see
rem https://github.com/hashicorp/packer/issues/6443 for details
packer build -var-file=packer/%1.json packer/template.json

:end
