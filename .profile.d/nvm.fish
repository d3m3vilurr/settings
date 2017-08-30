if test -f ~/.nvm/nvm.sh
    function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
    end
    bass source ~/.nvm/nvm.sh
end
set -x NODE_EXTRA_CA_CERTS /etc/ssl/certs/ea-root.pem
