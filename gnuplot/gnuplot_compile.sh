#!/bin/bash

sudo apt install qtbase5-dev qtbase5-dev-tools libqt5svg5-dev qttools5-dev-tools
./configure --with-qt=qt5

make -j # uses more jobs for faster compiling and linking
make check # make a test before installing
sudo make install # a better method would be to use checkinstall -> creates a deb
