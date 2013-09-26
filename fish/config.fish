for path in "$HOME/.profile.d" "$HOME/.config/fish/profile.d"
    if [ -d $path ]
        for i in $path/*.fish
            if [ -r $i ]
                . $i
            end
        end
    end
end
test -s /home/d3m3vilurr/.nvm/nvm.fish; and . /home/d3m3vilurr/.nvm/nvm.fish  # This loads NVM
