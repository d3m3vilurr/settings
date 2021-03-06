function .runsudo --description 'Run current command line as root'
    commandline -C 0
    commandline -i 'sudo '
end

function .!!
    commandline -i $history[1]
end

function fish_user_key_bindings
    # `alt-1` auto prepend `sudo`
    bind \e1 .runsudo
    # `alt-2` auto reinput prev command
    bind \e2 .!!

    bind \e\[1~ beginning-of-line
    bind \e\[4~ end-of-line
end
