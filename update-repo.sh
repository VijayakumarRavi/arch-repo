#!/bin/bash

# sudo rm -r temp/
mkdir ~/Git/arch-repo/temp

git-push() {
	cd ~/Git/arch-repo/
	sudo rm -r temp/
	git status
	sleep 5
	git add .
	git commit -m "updated to $1"
	git push
}

echo-test() {
	echo " this is a test $1"
}

install-yay() {
	rm ~/Git/arch-repo/x86_64/yay*
	cd ~/Git/arch-repo/temp/
	YVER=$(curl -sfLS 'https://api.github.com/repos/Jguer/yay/releases/latest' | grep 'browser_download_url' | tail -1 | cut -d '"' -f 4 | cut -d/ -f2- | awk -F'/' '{print $7}')
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -s
	mv -v *.pkg.tar.zst ~/Git/arch-repo/x86_64/
	git-push $YVER
}

install-chrome() {
	rm ~/Git/arch-repo/x86_64/google-chrome*
	cd ~/Git/arch-repo/temp/
	GVER=$(curl -sSf https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep -A1 "Package: google-chrome-stable" | awk '/Version/{print $2}' | cut -d '-' -f1)
	git clone https://aur.archlinux.org/google-chrome.git
	cd google-chrome
	makepkg -s
	mv -v *.pkg.tar.zst ~/Git/arch-repo/x86_64/
	git-push $GVER
}

install-yay
install-chrome
cd ~/Git/arch-repo/
# git-push
# GVER=$(curl -sSf https://dl.google.com/linux/chrome/deb/dists/stable/main/binary-amd64/Packages | grep -A1 "Package: google-chrome-stable" | awk '/Version/{print $2}' | cut -d '-' -f1)
# echo-test $GVER
