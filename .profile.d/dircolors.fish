if not set -q LS_COLORS
        and type -f dircolors > /dev/null
        and type -f ~/.dir_colors > /dev/null
    eval (dircolors -c ~/.dir_colors | sed 's/>&\/dev\/null$//')
end
