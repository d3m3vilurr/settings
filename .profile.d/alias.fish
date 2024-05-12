for uutil in /usr/bin/uu-*
    set command (string split -m1 uu- $uutil)[2]
    if [ $command = "test" ]
        continue
    end
    if [ $command = "[" ]
        continue
    end
    alias $command $uutil
end

function extends_color
    set command $argv[1]
    if [ (functions|grep "^$command\$"|wc -l) = 0 ]
        alias $command "/usr/bin/env $command --color=auto"
    else
        functions -c $command __fish_$command
        alias $command "__fish_$command --color=auto"
    end
end

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]
    extends_color ls
    extends_color grep
    extends_color fgrep
    extends_color egrep
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

function json
    /usr/bin/env python -m json.tool $argv
end

if type -fq $HOME/.local/bin/hub
    alias git hub
end

# gpg without agent
function gpg; /usr/bin/gpg --pinentry-mode loopback $argv; end

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
