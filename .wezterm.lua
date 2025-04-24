local wezterm = require("wezterm")
local config = {}
-- local dimmer = { brightness = 0.9 }

-- Given "/foo/bar" returns "bar"
function basename(s)
  return s:match("([^/]+)/*$")
end

wezterm.on(
  'format-tab-title',
  function(tab, _, _, _, _, max_width)
    -- local title = tab_title(tab)
    local pane = tab.active_pane
    local title = basename(pane.current_working_dir.path)
    if title == "petarpetrov" then
      title = "~"
    end

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Text = " " },
      { Text = title },
      { Text = " " },
    }
  end
)

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.window_decorations = "RESIZE" -- borderless window but with resize controls
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 10000
config.bold_brightens_ansi_colors = true
-- config.window_background_opacity = 0.7
-- config.macos_window_background_blur = 30
config.window_padding = {
  left = 16,
  right = 0,
  top = 0,
  bottom = 0,
}
-- config.window_background_image = "~/mreflowMatt_Wolfe_cosmos_desktop_background.jpeg"
-- config.background = {
-- 	{
-- 		source = { File = { path = "/Users/petarpetrov/paintingmountainlake.jpg" } },
-- 		height = "Cover",
-- 		width = "Cover",
-- 		horizontal_align = "Center",
-- 		repeat_x = "Cover",
-- 		repeat_y = "Repeat",
-- 		-- repeat_x = 'Mirror',
-- 		opacity = 0.8,
-- 		-- hsb = dimmer,
-- 		-- attachment = { Parallax = 0.1 },
-- 		-- speed = 200,
-- 	},
-- }

local theme_mode = "dark" -- light/dark

if theme_mode == "light" then
  -- theme tokyonight-day
  config.colors = {
    cursor_bg = "#3760bf",
    cursor_fg = "#e1e2e7",
    foreground = "#3760bf",
    background = "#e1e2e7",
    cursor_border = "#3760bf",
    selection_bg = "#b6bfe2",
    selection_fg = "#3760bf",
    ansi = {
      "#e9e9ed",
      "#f52a65",
      "#587539",
      "#8c6c3e",
      "#2e7de9",
      "#9854f1",
      "#007197",
      "#6172b0",
    },
    brights = {
      "#a1a6c5",
      "#f52a65",
      "#587539",
      "#8c6c3e",
      "#2e7de9",
      "#9854f1",
      "#007197",
      "#3760bf",
    },
    tab_bar = {
      inactive_tab_edge = "#e9e9ec",
      background = "#191b28",
      active_tab = {
        fg_color = "#2e7de9",
        bg_color = "#e1e2e7",
      },
      inactive_tab = {
        bg_color = "#e9e9ec",
        fg_color = "#8990b3",
      },
      inactive_tab_hover = {
        bg_color = "#e9e9ec",
        fg_color = "#2e7de9",
      },
      new_tab_hover = {
        fg_color = "#e9e9ec",
        bg_color = "#2e7de9",
      },
      new_tab = {
        fg_color = "#2e7de9",
        bg_color = "#191b28",
      },
    },
    visual_bell = "#202020",
  }
else
  -- -- theme tokyonight-moon
  config.colors = {
    cursor_bg = "#c8d3f5",
    cursor_fg = "#222436",
    foreground = "#c8d3f5",
    background = "#222436",
    cursor_border = "#c8d3f5",
    selection_bg = "#2d3f76",
    selection_fg = "#c8d3f5",
    ansi = {
      "#1b1d2b",
      "#ff757f",
      "#c3e88d",
      "#ffc777",
      "#82aaff",
      "#c099ff",
      "#86e1fc",
      "#828bb8",
    },
    brights = {
      "#444a73",
      "#ff757f",
      "#c3e88d",
      "#ffc777",
      "#82aaff",
      "#c099ff",
      "#86e1fc",
      "#c8d3f5",
    },
    tab_bar = {
      inactive_tab_edge = "#1e2030",
      background = "#191b28",
      active_tab = {
        fg_color = "#82aaff",
        bg_color = "#222436",
      },
      inactive_tab = {
        fg_color = "#545c7e",
        bg_color = "#1e2030",
      },
      inactive_tab_hover = {
        bg_color = "#1e2030",
        fg_color = "#82aaff",
      },
      new_tab_hover = {
        fg_color = "#1e2030",
        bg_color = "#82aaff",
      },
      new_tab = {
        fg_color = "#82aaff",
        bg_color = "#191b28",
      },
    },
    visual_bell = "#202020",
  }
end

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

config.keys = {
  {
    key = "/",
    mods = "CMD",
    action = wezterm.action.SendString("gcc"),
  },
  {
    key = "s",
    mods = "CMD",
    action = wezterm.action.SendString(":w\n"),
  },
  {
    key = "n",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 30 },
    }),
  },
  {
    key = "n",
    mods = "CMD|SHIFT|ALT",
    action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 20 } }),
  },
  {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  {
    key = "z",
    mods = "CMD",
    action = wezterm.action.TogglePaneZoomState,
  },
  { key = "F9",      mods = "ALT",       action = wezterm.action.ShowTabNavigator },
  { key = ">",       mods = "SHIFT|CMD", action = wezterm.action.SendString(":noh\n") },
  { key = "UpArrow", mods = "SHIFT|CMD", action = wezterm.action.SendString("incslt") },
  { key = "o",       mods = "SHIFT|CMD", action = wezterm.action.SendString(":NvimTreeToggle\n") },

  -- navigate between splits
  { key = "j",       mods = "SHIFT|CMD", action = wezterm.action.SendString("\x17\x6A") }, -- ctrl + w + j
  { key = "k",       mods = "SHIFT|CMD", action = wezterm.action.SendString("\x17\x6B") }, -- ctrl + w + k
  { key = "h",       mods = "SHIFT|CMD", action = wezterm.action.SendString("\x17\x68") }, -- ctrl + w + h
  { key = "l",       mods = "SHIFT|CMD", action = wezterm.action.SendString("\x17\x6c") }, -- ctrl + w + l
}

return config
