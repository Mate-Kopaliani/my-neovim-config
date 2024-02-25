local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require("lspconfig")

local function common_setup(server)
	server.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

common_setup(lspconfig.clangd)

common_setup(lspconfig.texlab)

common_setup(lspconfig.bashls)

common_setup(lspconfig.ocamllsp)

common_setup(lspconfig.cssls)

common_setup(lspconfig.dockerls)

lspconfig.jdtls.setup({
	filetypes = { "java" },
	require("custom.configs.java"),
})

lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact" },
})

lspconfig.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascriptreact", "javascript" },
	cmd = { "typescript-language-server", "--stdio" },
	init_options = {
		preferences = {
			disableSuggestions = true,
		},
	},
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
