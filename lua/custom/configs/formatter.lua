-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,

			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		c = {
			function()
				return {
					exe = "clang-format",
					args = {
						"--assume-filename",
						util.get_current_buffer_file_name(),
						"-style=Google",
					},
					stdin = true,
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = {
						"--assume-filename",
						util.get_current_buffer_file_name(),
						"-style=Google",
					},
					stdin = true,
				}
			end,
		},

		javascript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--double-quote",
						"true",
					},
					stdin = true,
				}
			end,
		},

		typescript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--double-quote",
						"--tab-width=2",
						"--trailing-comma=all",
						"--print-width=80",
						"--arrow-parens=always",
						"--jsx-single-quote=false",
						"--jsx-bracket-same-line=false",
						"--use-tabs=false",
						"--quote-props=as-needed",
						"--bracket-spacing=true",
					},
					stdin = true,
				}
			end,
		},

		typescriptreact = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--double-quote",
						"--tab-width=2",
						"--trailing-comma=all",
						"--print-width=80",
						"--arrow-parens=always",
						"--jsx-single-quote=false",
						"--jsx-bracket-same-line=false",
						"--use-tabs=false",
						"--quote-props=as-needed",
						"--bracket-spacing=true",
						"--jsx=react",
					},
					stdin = true,
				}
			end,
		},

		javascriptreact = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--double-quote",
						"--tab-width=2",
						"--trailing-comma=all",
						"--print-width=80",
						"--arrow-parens=always",
						"--jsx-single-quote=false",
						"--jsx-bracket-same-line=false",
						"--use-tabs=false",
						"--quote-props=as-needed",
						"--bracket-spacing=true",
						"--jsx=react",
					},
					stdin = true,
				}
			end,
		},

		html = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.api.nvim_buf_get_name(0),
						"--double-quote",
						"true",
						"--tab-width 4",
					},
					stdin = true,
				}
			end,
		},

		css = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						vim.api.nvim_buf_get_name(0),
						"--double-quote",
						"true",
					},
					stdin = true,
				}
			end,
		},

		python = {
			function()
				return {
					exe = "black",
					args = { "--quiet", "-" },
					stdin = true,
				}
			end,
		},

		json = {
			function()
				return {
					exe = "jq",
					args = { ".", "--indent", "4" },
					stdin = true,
				}
			end,
		},

		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
