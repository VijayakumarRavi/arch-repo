#!/bin/bash

# sudo rm -r temp/
mkdir temp && cd temp

update-yay() {
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -s
	mv -v *.pkg.tar.zst ../../x86_64/.
}

update-yay

cd ../..
sudo rm -r temp/
