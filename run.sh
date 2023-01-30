#!/bin/bash

docker run  --name "debian-11-cis-hardened" -v "$(pwd)/conf.d:/opt/cis-hardening/etc/conf.d" -it "debian-11-cis-hardened"