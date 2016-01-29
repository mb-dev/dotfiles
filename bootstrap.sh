#!/bin/bash

ABSOLUTE_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
ln -s ${ABSOLUTE_PATH}/.vim ~/.config/nvim
ln -s ${ABSOLUTE_PATH}/.vimrc ~/.config/nvim/init.vim
