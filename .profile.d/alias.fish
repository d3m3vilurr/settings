# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]
    function ls; /usr/bin/env ls --color=auto $argv; end
    function grep; /usr/bin/env grep --color=auto $argv; end
    function fgrep; /usr/bin/env fgrep --color=auto $argv; end
    function egrep; /usr/bin/env egrep --color=auto $argv; end
end

# some more ls aliases
function ll;  ls -alF $argv; end
function la;  ls -A $argv; end
function l;   ls -CF $argv; end
function lal; ll $argv; end

# use tab mode vim always
function vim; /usr/bin/env vim -p $argv; end
alias vi vim

# local alias
function suod; /usr/bin/env sudo $argv; end
function tmux; /usr/bin/env tmux -2 $argv; end
function screen; /usr/bin/env tmux -2 $argv; end
function gt; /usr/bin/env git $argv; end
function gi; /usr/bin/env git $argv; end
if type -fq gcp
    if set -q DBUS_SESSION_BUS_ADDRESS
        alias cp gcp
    end
end
function time
	/usr/bin/env time -f "\t%e real\t%U user\t%S sys\t%P CPU\t%x status" $argv
end

function json
    /usr/bin/env python -m json.tool $argv
end

if type -fq $HOME/.local/bin/hub
    alias git hub
end

# terminal locale
function sshkr; luit -encoding eucKR +osl -- ssh $argv; end
function telnetkr; luit -encoding eucKR +osl -- telnet $argv; end

# mosh with X forward
function moshx; mosh --ssh="ssh -X" $argv; end

# babel-mocha
function babel-mocha; mocha --compilers js:babel-core/register -t 10000 $argv; end

# pbcopy and pbpaste
function pbcopy; xsel --clipboard --input $argv; end
function pbpaste; xsel --clipboard --output $argv; end

# ssh socks5 proxy; -D port host
function ssh-proxy; ssh -C2qTnN $argv; end
