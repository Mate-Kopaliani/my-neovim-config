local plugins = {
	-- {
	-- 	"codota/tabnine-nvim",
	-- 	build = "./dl_binaries.sh",
	-- },
	{
		"mfussenegger/nvim-jdtls",
		event = "BufRead",
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
	},

	{
		"barrett-ruth/live-server.nvim",
		build = "pnpm add -g live-server",
		cmd = { "LiveServerStart", "LiveServerStop" },
		config = true,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dap")
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mhartington/formatter.nvim",
		event = "VeryLazy",
		config = function()
			require("custom.configs.formatter")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"tsx",
				"typescript-language-server",
				"js-debug-adapter",
				"eslint-lsp",
				"prettier",
				"clangd",
				"pyright",
				"rust-analyzer",
				"codedlldb",
				"bash-language-server",
				"ocaml-language-server",
				"clang-format",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
}

return plugins
