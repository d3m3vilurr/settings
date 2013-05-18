function .runsudo --description 'Run current command line as root'
    set cursor_pos (echo (commandline -C) + 5 | bc)
    commandline -C 0
    commandline -i 'sudo '
    commandline -C "$cursor_pos"
end

function .!!
    commandline -i $history[1]
end

function fish_user_key_bindings
    # `alt-1` auto prepend `sudo`
    bind \e1 .runsudo
    # `alt-2` auto reinput prev command
    bind \e2 .!!
end
