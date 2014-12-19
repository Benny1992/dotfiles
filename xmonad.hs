import XMonad
import XMonad.Layout.NoBorders

main = do
    xmonad $ defaultConfig
        { layoutHook = smartBorders  $  layoutHook defaultConfig
        , modMask = mod4Mask
        , terminal = "gnome-terminal"
        }
