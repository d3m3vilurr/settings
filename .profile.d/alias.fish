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
if type -f gcp > /dev/null
    if set -q DBUS_SESSION_BUS_ADDRESS
        alias cp gcp
    end
end
function time
	/usr/bin/env time -f "\t%e real\t%U user\t%S sys\t%P CPU\t%x status" $argv
end

# terminal locale
function sshkr; luit -encoding eucKR +osl -- ssh $argv; end
function telnetkr; luit -encoding eucKR +osl -- telnet $argv; end

# mosh with X forward
function moshx; mosh --ssh="ssh -X" $argv; end
