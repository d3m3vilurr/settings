if test -f ~/.nvm/nvm.sh
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end
    bass source ~/.nvm/nvm.sh
end
