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
function sudo; /usr/bin/env sudo -E $argv; end
function suod; /usr/bin/env sudo -E $argv; end
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

# pbcopy and pbpaste
function pbcopy
    if set -q WAYLAND_DISPLAY
        wl-copy
    else
        xsel --clipboard --input $argv
    end
end

function pbpaste
    if set -q WAYLAND_DISPLAY
        wl-paste
    else
        xsel --clipboard --output $argv
    end
end

# ssh socks5 proxy; -D port host
function ssh-proxy; ssh -C2qTnN $argv; end

# insync file manage
function insync-manage; insync manage_selective_sync $argv; end

# shortcut yay
function yy; /usr/bin/yay $argv; end
