local db = require("dashboard")

db.custom_header = {
	"███████╗██╗   ██╗██╗███╗   ███╗",
	"██╔════╝██║   ██║██║████╗ ████║",
	"█████╗  ██║   ██║██║██╔████╔██║",
	"██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║",
	"███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"                               ",
}

db.custom_center = {
	{
		icon = "פּ ",
		desc = "File Tree",
		action = "NvimTreeOpen",
	},
	{
		icon = " ",
		desc = "Files",
		action = "Telescope find_files hidden=true",
	},
	{ icon = " ", desc = "Recent Files", action = "Telescope oldfiles" },
	{ icon = " ", desc = "New File", action = "enew" },
	{
		icon = " ",
		desc = "Find Text",
		action = 'Telescope grep_string search="" only_sort_text=true',
	},
	{
		icon = " ",
		desc = "Restore Session",
		action = "set showtabline=2 | SessionLoad",
	},
	{
		icon = " ",
		desc = "Settings",
		action = "e ~/.config/nvim/settings.lua",
	},
}

db.custom_footer = { "github.com/e-cal" }
