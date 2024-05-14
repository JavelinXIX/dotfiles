local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.keys = {
    {
        key = '%',
        mods = 'ALT|SHIFT',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
        key = '"',
        mods = 'ALT|SHIFT',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
        key = 'H',
        mods = 'ALT|SHIFT',
        action = act.AdjustPaneSize { 'Left', 3 },
    },
    {
        key = 'J',
        mods = 'ALT|SHIFT',
        action = act.AdjustPaneSize { 'Down', 3 },
    },
    { 
        key = 'K', 
        mods = 'ALT|SHIFT',
        action = act.AdjustPaneSize { 'Up', 3 } ,
    },
    {
        key = 'L',
        mods = 'ALT|SHIFT',
        action = act.AdjustPaneSize { 'Right', 3 },
    },
}
config.enable_scroll_bar = true
config.color_scheme = 'nightfox'

return config
