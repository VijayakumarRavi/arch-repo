#!/bin/bash

# sudo rm -r temp/
mkdir ~/Git/arch-repo/temp

update-yay() {
	rm ~/Git/arch-repo/x86_64/yay*
	cd ~/Git/arch-repo/temp/
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -s
	mv -v *.pkg.tar.zst ~/Git/arch-repo/x86_64/
}

git-push() {
	cd ~/Git/arch-repo/
	$ver = curl -sfLS 'https://api.github.com/repos/Jguer/yay/releases/latest' | grep 'browser_download_url' | tail -1 | cut -d '"' -f 4 | cut -d/ -f2- | awk -F'/' '{print $7}'
	git status
	sleep 5
	git add .
	git commit -m "updated to $ver"
	git push
}

update-yay

cd ~/Git/arch-repo/
sudo rm -r temp/

git-push
