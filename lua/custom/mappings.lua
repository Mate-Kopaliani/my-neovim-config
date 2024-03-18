local M = {}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "add breakpoint at line" },
		["<leader>dr"] = { "<cmd> DapContinue <CR>", "Run or Continue the debugger" },
	},
}

return M
