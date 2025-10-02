return {
	sections = {
		{
			section = "startup",
			padding = 1,
			enabled = function()
				return not (vim.o.columns > 135)
			end,
		},
		{
			pane = 2,
			indent = 4,
			{
				section = "keys",
				gap = 0,
				padding = 1,
			},
			{
				icon = " ",
				title = "Recent Files",
			},
			{
				section = "recent_files",
				opts = {
					limit = 3,
				},
				indent = 4,
				padding = 1,
			},
			{
				icon = " ",
				title = "Projects",
			},
			{
				section = "projects",
				opts = {
					limit = 10,
				},
				indent = 4,
				padding = 1,
			},
		},
		{
			pane = 1,
			align = "center",
			section = "terminal",
			cmd = "starfetch -c magenta -r",
			--cmd = "nyancat",
			height = 12,
			padding = 1,
		},
		{
			title = "Maintenance Actions",
			padding = 1,
			{
				icon = " ",
				key = "c",
				desc = "Config",
				action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
			},
			{
				icon = "󱁤 ",
				key = "m",
				desc = "Mason",
				action = ":Mason",
			},
		},
	},
}
