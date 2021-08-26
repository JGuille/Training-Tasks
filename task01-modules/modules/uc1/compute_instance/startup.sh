 #!/bin/bash
sudo apt-get -y update
sudo apt-get -y install cowsay
command="/usr/games/cowsay hi > /home/ubuntu/output.log"
eval $command