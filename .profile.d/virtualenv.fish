set -gx WORKON_HOME $HOME/.venvs
set -gx VIRTUALFISH_HOME $WORKON_HOME
set -gx PROJECT_HOME $HOME/works

if [ -f $HOME/.config/fish/virtualfish/virtual.fish ]
     . $HOME/.config/fish/virtualfish/virtual.fish
end

function workon; acvirtualenv $argv; end
function deactive; devirtualenv; end
