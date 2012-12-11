#!/bin/bash
MAVEN_HOME=~/Applications/springsource/apache-maven-3.0.4
echo "######################################" >> ~/.bash_profile
echo "export MAVEN_HOME=$MAVEN_HOME" >> ~/.bash_profile
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> ~/.bash_profile

cp maven/setting.xml $MAVEN_HOME/conf/
