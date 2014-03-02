function _dircolors_set_256_color
    if type -f dircolors > /dev/null and type -f ~/.dircolors.256 > /dev/null
        eval (dircolors -c ~/.dircolors.256 | sed 's/>&\/dev\/null$//')
    end
end

function _dircolors_set_ansi_color
    if type -f dircolors > /dev/null and type -f ~/.dircolors.ansi > /dev/null
        eval (dircolors -c ~/.dircolors.ansi | sed 's/>&\/dev\/null$//')
    end
end

switch (echo $TERM)
    case linux
        _dircolors_set_ansi_color
    case '*'
        _dircolors_set_256_color
end
