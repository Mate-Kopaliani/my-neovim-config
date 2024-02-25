local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "add breakpoint at line" },
		["<leader>dr"] = { "<cmd> DapContinue <CR>", "Run or Continue the debugger" },
		["<leader>s"] = { "<cmd>vsplit<CR>", "split new vertical tab" }, -- Corrected vsplit command
		["<leader>cs"] = { "<cmd>close<CR>", "close tab" }, -- Corrected vsplit command
	},
}

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

return M
