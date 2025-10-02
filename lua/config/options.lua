-- leader key
vim.g.mapleader = ","

-- general options
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.clipboard:append({ "unnamedplus" })
vim.opt.tabstop = 2

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- docker-compose filetype detection
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "docker-compose.yml", "compose.yml" },
	callback = function()
		vim.bo.filetype = "yaml.docker-compose"
	end,
})

vim.g.coc_filetype_map = {
	["yaml.docker-compose"] = "dockercompose",
}

-- osc52 clipboard provider
local function copy(lines, _)
	require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
	return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
	name = "osc52",
	copy = { ["+"] = copy, ["*"] = copy },
	paste = { ["+"] = paste, ["*"] = paste },
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set("n", "<leader>c", '"+y')
vim.keymap.set("n", "<leader>cc", '"+yy')
