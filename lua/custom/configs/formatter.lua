-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
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

		-- Formatter configurations for C/C++ and Java
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

		java = {
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

		-- Formatter configuration for JavaScript using Prettier
		javascript = {
			function()
				return {
					exe = "prettier",
					args = {
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--single-quote",
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
						"--single-quote=true",
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
						"--single-quote=true",
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
						"--single-quote=true",
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
						"--single-quote",
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
						"--single-quote",
						"true",
					},
					stdin = true,
				}
			end,
		},

		-- Formatter configuration for Python using Black
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
					args = { ".", "--indent", "4" }, -- You can customize jq options here
					stdin = true,
				}
			end,
		},

		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
