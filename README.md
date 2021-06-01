# Arch-repo
  ## How to "install" arch-repo
  Adding a third-party repository (like this one) is easy.  Just add the following lines to the end of /etc/pacman.conf :
  ```
  [dt-arch-repo]
  SigLevel = Optional DatabaseOptional
  Server = https://gitlab.com/dwt1/$repo/-/raw/master/$arch
  ```

Then, sync the repositories and update your system with:
``` sudo pacman -Syyu ```

And, then:
```sudo pacman -S name-of-package```
