#!/usr/bin/env bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -d ~/.bash_completion.d ]; then
  for i in ~/.bash_completion.d/*.bash; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

