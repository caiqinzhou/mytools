
mkdir -p ~/Applications/

cd nexus
tar -xf nexus-2.2-01-bundle.tar.gz
mv nexus-2.2-01 ~/Applications/
mv sonatype-work ~/Applications/
ln -s ~/Applications/nexus-2.2-01 ~/Applications/nexus

echo "############ NEXUS ##############" >> ~/.bash_profile
echo "export NEXUS_HOME=~/Applications/nexus" >> ~/.bash_profile
echo "export RUN_AS_USER=root" >> ~/.bash_profile

