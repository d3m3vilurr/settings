#!/usr/bin/env bash

export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/works

if [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
    source $HOME/.local/bin/virtualenvwrapper.sh
fi
