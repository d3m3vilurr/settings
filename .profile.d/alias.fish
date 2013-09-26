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


# local alias
function suod; /usr/bin/env sudo $argv; end
function tmux; /usr/bin/env tmux -2 $argv; end
function screen; /usr/bin/env tmux -2 $argv; end
function gt; /usr/bin/env git $argv; end
function gi; /usr/bin/env git $argv; end
alias cp gcp

# terminal locale
function sshkr; luit -encoding eucKR +osl -- ssh $argv; end
function telnetkr; luit -encoding eucKR +osl -- telnet $argv; end

# mosh with X forward
function moshx; mosh --ssh="ssh -X" $argv; end
