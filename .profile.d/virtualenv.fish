set -gx WORKON_HOME $HOME/.venvs
set -gx VIRTUALFISH_HOME $WORKON_HOME
set -gx PROJECT_HOME $HOME/works
set -gx VIRTUALFISH_COMPAT_ALIASES

if [ -f $HOME/.config/fish/virtualfish/virtual.fish ]
     source $HOME/.config/fish/virtualfish/virtual.fish
else if [ -f $HOME/.config/fish/virtualfish/setup.py ]
     eval (python $HOME/.config/fish/virtualfish/virtualfish compat_aliases)
end
