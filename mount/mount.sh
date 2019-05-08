#!/bin/sh

cd /media/
mount -t vboxsf code /media/sf_code
mount -t vboxsf project /media/sf_project
mount -t vboxsf svn /media/sf_svn
mount -t vboxsf workspace /media/sf_workspace
mount -t vboxsf release /media/sf_release
cd -
