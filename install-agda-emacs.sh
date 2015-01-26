#!/bin/bash
sudo add-apt-repository ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt-get install emacs-snapshot emacs-snapshot-el Agda
mkdir -p ~/emacs.d/site-lisp/
wget -P ~/emacs.d/site-lisp/ http://code.haskell.org/Agda/src/data/emacs-mode/agda2-mode.el
touch ~/.emacs
echo "(add-to-list \'load-path \"~/.emacs.d/site-lisp/agda2-mode\")" >> ~/.emacs
echo "(require \'agda2-mode)" >> ~/.emacs
echo "\n" >> ~/.emacs
echo "install completed successfully!!"
emacs &
