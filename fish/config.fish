for path in "$HOME/.profile.d" "$HOME/.config/fish/profile.d"
    if [ -d $path ]
        for i in $path/*.fish
            if [ -r $i ]
                . $i
            end
        end
    end
end
test -s /home/sulee/.nvm/nvm.fish; and . /home/sulee/.nvm/nvm.fish  # This loads NVM
