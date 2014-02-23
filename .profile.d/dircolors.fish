switch (echo $TERM)
    case linux
        if not set -q LS_COLORS
                and type -f dircolors > /dev/null
                and type -f ~/.dircolors.ansi > /dev/null
            eval (dircolors -c ~/.dircolors.ansi | sed 's/>&\/dev\/null$//')
        end
    case '*'
        if not set -q LS_COLORS
                and type -f dircolors > /dev/null
                and type -f ~/.dircolors.256 > /dev/null
            eval (dircolors -c ~/.dircolors.256 | sed 's/>&\/dev\/null$//')
        end
end
