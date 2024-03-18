require("todo-comments")

require("nvim-ts-autotag").setup({
	filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "xml" },
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 0,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
-- CursorLine highlight
vim.cmd([[

   augroup ilikecursorline
      autocmd VimEnter * :highlight CursorLine guibg=#1c1c1c
   augroup END

]])

vim.api.nvim_exec(
	[[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]],
	false
)

-- line number
vim.cmd("set rnu! ")

-- remove tabs
vim.cmd("set showtabline=0")

-- close current buffer
vim.api.nvim_set_keymap("n", "<Leader>x", ":bd<CR>", { noremap = true, silent = true })

-- require("custom.configs.harpoon")
