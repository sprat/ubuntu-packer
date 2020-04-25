@echo off
if "%1" == "" (
    echo Usage: %0 JSON_FILE
    echo where JSON_FILE is ubuntu-server-20.04.json, xubuntu-20.04.json, ...
    goto :end
)

packer build -timestamp-ui -var-file=%1 packer/template.json

:end
