local metals_config = require("metals").bare_config()

metals_config.on_attach = function(client, bufnr)
	require("metals").seup_dap()
	Lsp_keymap(client, bufnr)
end

metals_config.settings = {
	showImplicitArguments = true,
}

metals_config.init_options.statusBarProvider = "on"
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"scala", "sbt", "java"},
	callback = function()
		require("metals").initialize_or_attach(metals_config)
	end,
	group = nvim_metals_group,
})

