#!/usr/bin/env fish
if test -f ~/.rsvm/rsvm.fish
    source ~/.rsvm/rsvm.fish
    set -l current (bash -c "source ~/.rsvm/rsvm.sh && rsvm_current")
    if [ $current != "N/A" ]
        rsvm use $current > /dev/null
    end
end
