local status_ok, _ = pcall(require, "dashboard")

if not status_ok then
	return
end

local dash = require("dashboard")

-- dash.dashboard_default_executive = "telescope"

dash.header_pad = 6

dash.custom_header = {
	[[                                                          ]],
	[[                                                          ]],
	[[███╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗ ██████╗  ██████╗ ]],
	[[████╗  ██║██║   ██║██║████╗ ████║██╔══██╗██╔══██╗██╔═══██╗]],
	[[██╔██╗ ██║██║   ██║██║██╔████╔██║██████╔╝██████╔╝██║   ██║]],
	[[██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔═══╝ ██╔══██╗██║   ██║]],
	[[██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║██║     ██║  ██║╚██████╔╝]],
	[[╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝ ]],
	[[                                                          ]],
	[[                                                          ]],
}

dash.center_pad = 4

dash.custom_center = {
	{
		icon = "  ",
		desc = "Browse projects                     ",
		shortcut = "SPC d p",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		desc = "Find  File                          ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC d E",
	},
	{
		icon = "  ",
		desc = "Git status                          ",
		action = "Telescope git_status",
		shortcut = "SPC d S",
	},
	{
		icon = "  ",
		desc = "Find  words                         ",
		action = "Telescope live_grep",
		shortcut = "SPC d w",
	},
	-- {
	-- 	icon = "  ",
	-- 	desc = "Open Personal dotfiles                  ",
	-- 	action = "Telescope dotfiles path=" .. home .. "/.dotfiles",
	-- 	shortcut = "SPC f d",
	-- },
}
