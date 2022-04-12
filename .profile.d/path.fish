function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

function append_to_path
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH $PATH "$argv[1]"
        end
    end
end

function prepend_to_ld_lib_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $LD_LIBRARY_PATH
            set -gx LD_LIBRARY_PATH "$argv[1]" $LD_LIBRARY_PATH
        end
    end
end

prepend_to_path $HOME/.local/bin
prepend_to_path $HOME/bin
prepend_to_path /opt/wine-compholio/bin
prepend_to_path $HOME/.gem/ruby/2.3.0/bin
prepend_to_path $HOME/.cargo/bin

if [ $DEVKITARM ]
    prepend_to_path "$DEVKITARM/bin"
end

if [ $DEVKITA64 ]
    prepend_to_path "$DEVKITA64/bin"
end

if [ $DEVKITMIPS ]
    prepend_to_path "$DEVKITMIPS/bin"
end

if [ $VITASDK ]
    prepend_to_path "$VITASDK/bin"
    prepend_to_path "$VITASDK/usr/sbin"
end

if [ $ANDROID_NDK ]
    prepend_to_path "$ANDROID_NDK/build"
end

if test -d $HOME/opt/radare2/bin
    prepend_to_path "$HOME/opt/radare2/bin"
end

if test -d $HOME/opt/radare2/lib
    prepend_to_ld_lib_path "$HOME/opt/radare2/lib"
end

if test -d /opt/android-sdk/platform-tools
    append_to_path /opt/android-sdk/platform-tools
end

