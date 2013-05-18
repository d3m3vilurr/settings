#!/usr/bin/env bash

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]
    function ls; /usr/bin/env ls --color=auto $argv; end
    function grep; /usr/bin/env grep $OPTS; end
    function fgrep; /usr/bin/env fgrep $OPTS; end
    function egrep; /usr/bin/env egrep $OPTS; end
end

# some more ls aliases
function ll;  ls -alF $argv; end
function la;  ls -A $argv; end
function l;   ls -CF $argv; end
function lal; ll $argv; end


# local alias
function suod; /usr/bin/env sudo; end
function tmux; /usr/bin/env tmux -2; end
function screen; /usr/bin/env tmux -2; end
function gt; /usr/bin/env git; end
function gi; /usr/bin/env git; end

# terminal locale
function sshkr; luit -encoding eucKR +osl -- ssh; end
function telnetkr; luit -encoding eucKR +osl -- telnet; end

# mosh with X forward
function moshx; mosh --ssh="ssh -X"; end
