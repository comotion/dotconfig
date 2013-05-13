import XMonad
import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops

import XMonad.Actions.PhysicalScreens

import ScratchPadKeys (scratchPadList, manageScratchPads, scratchPadKeys)
import XMonad.Util.EZConfig (additionalKeysP)

main = do
	xmonad $ defaultConfig
		{ terminal           = "urxvtc"
		, modMask            = mod4Mask
		, borderWidth        = 1
		, handleEventHook    = fullscreenEventHook
		, workspaces         = myWorkspaces
		, manageHook         = myManageHook
		} `additionalKeysP` myKeys

myManageHook :: ManageHook
myManageHook = composeAll [] <+> manageScratchPads scratchPadList

myWorkspaces = ["1:view", "2:code", "3:x", "4:y", "5:z", "6:w", "7:z", "8:media", "9:communicate"]

myKeys :: [(String, X())]
myKeys = [
	  ("M-d"                        , spawn "dmenu_run"                         )
	, ("M-S-d"                      , spawn "gmrun"                         )
	, ("<XF86AudioMute>"            , spawn "amixer sset Master toggle"     )
	, ("<XF86AudioRaiseVolume>"     , spawn "amixer sset Master 1%+ unmute" )
	, ("<XF86AudioLowerVolume>"     , spawn "amixer sset Master 1%- unmute" )
	, ("<XF86AudioNext>"            , spawn "DISPLAY=:0 dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"          )
	, ("<XF86AudioPrev>"            , spawn "DISPLAY=:0 dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"      )
	, ("<XF86AudioPlay>"            , spawn "DISPLAY=:0 dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"     )
	, ("M-w"                        , viewScreen 0)
	, ("M-e"                        , viewScreen 1)
	, ("M-r"                        , viewScreen 2)
	, ("M-S-w"                      , sendToScreen 0)
	, ("M-S-e"                      , sendToScreen 1)
	, ("M-S-r"                      , sendToScreen 2)
	, ("M-S-q"                      , spawn "xfce4-session-logout")
	] ++ scratchPadKeys scratchPadList
