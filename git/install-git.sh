#!/bin/bash
wget https://github.com/git/git/tarball/v1.7.12 --no-check-certificate
tar -xf v1.7.12
cd git-*
make configure
./configure
make
make install

echo "================== Finish ==================="
