function _term_color_reset
    switch (echo $TERM)
        case linux
            echo -en "\e]P0002b36" # console background (dark blue)
            echo -en "\e]P1dc322f" # vim escape characters, whitespace in git show, untracked files in git status
            echo -en "\e]P2859900" # vim keywords, selection bg, bracket matching bg
            echo -en "\e]P3268bd2" # xresources key names
            echo -en "\e]P4cb4b16" # vim constants, cursor, mode indicator, sqbracket match fg
            echo -en "\e]P593a1a1" # xresources keywords
            echo -en "\e]P62aa198" # xresources values, vim strings, search bg color
            echo -en "\e]P7839496" # console foreground text (light grey)
            echo -en "\e]P8073642" # vim selection fg
            echo -en "\e]P9cb4b16" # vim variables
            echo -en "\e]PA586e75" # vim comments
            echo -en "\e]PB657b83" # vim empty line markers ~
            echo -en "\e]PC2aa198" # ls directory color, vim message color (cyan)
            echo -en "\e]PDd33682" # magenta
            echo -en "\e]PE0000ff" # debug blue
            echo -en "\e]PF859900" # command executed in git show
            #clear #for background artifacting
        case xterm
            set -x TERM 'xterm-256color'
    end
end

function fbterm
    set -x FBTERM 1
    /usr/bin/fbterm /usr/bin/uim-fep $argv
    set -e FBTERM
    _term_color_reset
end

_term_color_reset
