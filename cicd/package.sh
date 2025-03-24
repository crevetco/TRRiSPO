#!/bin/bash
cd src
dh_make --native --single --packagename myprogram_1.0.0 --yes
dpkg-buildpackage -us -uc -b