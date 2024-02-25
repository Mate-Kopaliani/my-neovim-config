local dap = require("dap")

dap.adapters["pwa-node"] = {
	type = "server",
	host = "::1",
	port = 8123,
	executable = {
	command = "js-debug-adapter",
	},
}

for _, language in ipairs({ "typescript", "javascript" }) do
	dap.configurations[language] = {
		{
			type = "pwa-node",
			request = "launch",
			name = "Lauch file",
			program = "${file}",
			cwd = "${workspaceFolder}",
		},
	}
end
