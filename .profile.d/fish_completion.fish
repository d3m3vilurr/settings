for path in "$HOME/.fish_completion.d" "$HOME/.config/fish/fish_completion.d"
    if [ -d $path ]
        for i in $path/*.fish
            if [ -r $i ]
                . $i
            end
        end
    end
end
