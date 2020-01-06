set -gx WORKON_HOME $HOME/.venvs
set -gx VIRTUALFISH_HOME $WORKON_HOME
set -gx PROJECT_HOME $HOME/works
set -gx VIRTUALFISH_COMPAT_ALIASES

if [ -f $HOME/.config/fish/virtualfish/virtual.fish ]
    source $HOME/.config/fish/virtualfish/virtual.fish
else if [ -f $HOME/.config/fish/virtualfish/setup.py ]
    if not functions --query "__vf_install"
        if type -fq vf
            vf install
        else
            echo "Couldn't find `vf` command"
            echo "Please install the virtualfish with pip3 in the $HOME/.config/fish/virtualfish"
        end
    end
end
