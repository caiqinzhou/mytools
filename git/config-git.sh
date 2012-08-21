#!/bin/bash

###### CONFIG GIT ######

git config --global http.sslVerify false
git config --global user.name "caiqinzhou"
git config --global user.email "caiqinzhou@gmail.com"
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=7200'

echo "###### Finish ######"
