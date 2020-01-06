# devkitPro
set -gx DEVKITPRO /opt/devkitpro
if test -d $DEVKITPRO/devkitARM
    set -gx DEVKITARM $DEVKITPRO/devkitARM
end
if test -d $DEVKITPRO/devkitA64
    set -gx DEVKITA64 $DEVKITPRO/devkitA64
end
if test -d $DEVKITPRO/devkitPPC
    set -gx DEVKITPPC $DEVKITPRO/devkitPPC
end
if test -d $DEVKITPRO/devkitMIPS
    set -gx DEVKITMIPS $DEVKITPRO/devkitMIPS
end

# vitasdk
set -gx VITASDK $HOME/opt/vitasdk
