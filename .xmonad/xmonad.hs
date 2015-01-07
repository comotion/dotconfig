import XMonad
import XMonad.Prompt
import qualified XMonad.StackSet as W

import XMonad.Hooks.SetWMName
import XMonad.Hooks.EwmhDesktops

import XMonad.Actions.PhysicalScreens
import XMonad.Actions.DynamicWorkspaces
import XMonad.Actions.CopyWindow(copy, kill1)
import XMonad.Actions.CycleWS
import XMonad.Actions.GridSelect

import XMonad.Layout.NoBorders
import XMonad.Layout.GridVariants

import ScratchPadKeys (scratchPadList, manageScratchPads, scratchPadKeys)
import XMonad.Util.EZConfig (additionalKeysP)

---import Data.List ( findIndex )

main = do
	xmonad $ defaultConfig
		{ layoutHook         = smartBorders Full ||| SplitGrid L 2 3 (2/3) (16/10) (5/100)
		, terminal           = "urxvtc"
		, modMask            = mod4Mask
		, borderWidth        = 1
		, handleEventHook    = fullscreenEventHook
		, workspaces         = myWorkspaces
		, manageHook         = myManageHook
		} `additionalKeysP` myKeys

myWorkspaces = ["misc"]

myManageHook :: ManageHook
myManageHook = composeAll [] <+> manageScratchPads scratchPadList


---nextOrNewWorkspace = workspace (current ws)
---	where ws = gets windowset
---
---findWsIndex :: WindowSpace -> [WindowSpace] -> Maybe Int
---findWsIndex ws wss = findIndex ((== tag ws) . tag) wss


myKeys :: [(String, X())]
myKeys = [
	  ("M-d"                        , spawn "dmenu_run"                         )

	, ("<XF86AudioMute>"            , spawn "amixer sset Master toggle"     )
	, ("<XF86AudioRaiseVolume>"     , spawn "amixer sset Master 1%+ unmute" )
	, ("<XF86AudioLowerVolume>"     , spawn "amixer sset Master 1%- unmute" )
	, ("<XF86AudioMicMute>"         , spawn "amixer sset Mic toggle" )
	, ("<XF86AudioNext>"            , spawn "DISPLAY=:0 dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"          )
	, ("<XF86AudioPrev>"            , spawn "DISPLAY=:0 dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"      )
	, ("<XF86AudioPlay>"            , spawn "DISPLAY=:0 dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"     )

	, ("M-s>"                     , spawn "xrandr --auto")

	, ("M-="                        , sendMessage $ IncMasterCols 1)
	, ("M--"                        , sendMessage $ IncMasterCols (-1))
	, ("M-S-="                      , sendMessage $ IncMasterRows 1)
	, ("M-S--"                      , sendMessage $ IncMasterRows (-1))

	, ("C-M-<Backspace>"            , spawn "slock")
	, ("M-<Backspace>"              , removeWorkspace)
	, ("M-v"                        , selectWorkspace defaultXPConfig)
	, ("M-m"                        , withWorkspace defaultXPConfig (windows . W.shift))
	, ("M-c"                        , withWorkspace defaultXPConfig (windows . copy))
	, ("M-S-r"                      , renameWorkspace defaultXPConfig)

	, ("M-<Left>"                   , prevWS)
	, ("M-<Right>"                  , nextWS)
	, ("M-S-<Left>"                 , shiftToPrev >> prevWS)
	, ("M-S-<Right>"                , shiftToNext >> nextWS)

	, ("M-w"                        , viewScreen 0)
	, ("M-e"                        , viewScreen 1)
	, ("M-r"                        , viewScreen 2)
	, ("M-S-w"                      , sendToScreen 0)
	, ("M-S-e"                      , sendToScreen 1)
	, ("M-S-r"                      , sendToScreen 2)

	, ("M-g"                        , goToSelected defaultGSConfig)

	, ("M-S-c"                      , kill1)
	, ("M-S-q"                      , spawn "xfce4-session-logout")
	] ++ scratchPadKeys scratchPadList
