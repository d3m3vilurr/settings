for path in "$HOME/.profile.d" "$HOME/.config/fish/profile.d"
    if [ -d $path ]
        for i in $path/*.fish
            if [ -r $i ]
                source $i
            end
        end
    end
end
