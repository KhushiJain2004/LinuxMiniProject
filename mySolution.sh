#!/bin/bash
wget https://exit-zero-academy.github.io/DevOpsTheHardWayAssets/linux_project/secretGenerator.tar.gz
gunzip secretGenerator.tar.gz
tar -xvf secretGenerator.tar
cd src
rm -rf ./maliciousFiles
mkdir -p ./secretDir
touch ./secretDir/.secret
chmod 600 ./secretDir/.secret

chmod +x ./generateSecret.sh

./generateSecret.sh
SECRET=$(head -n 1 ./secretDir/.secret)
cd ..
echo "$SECRET" | cut -c -32 > SOLUTION