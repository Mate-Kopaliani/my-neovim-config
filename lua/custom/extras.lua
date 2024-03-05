require("custom.configs.harp")

require("todo-comments")

require("transparent").setup({ -- Optional, you don't have to run setup.
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLine",
		"CursorLineNr",
		"StatusLine",
		"StatusLineNC",
		"EndOfBuffer",
	},
	extra_groups = {}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
})

require("nvim-ts-autotag").setup({
	filetypes = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "xml" },
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
