require'mason'.setup()
require('keymap')
require("lsp_lines").setup()
vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {only_current_line = true}
})
-- require("lsp/scala")

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason-lspconfig').setup({
	handlers = {
		function(server)
				require('lspconfig')[server].setup({
					on_attach = Lsp_keymap,
					capabilities = capabilities,
				})
		end,

		["solargraph"] = function()
			require('lspconfig')["solargraph"].setup({
				cmd = {
					"solargraph",
					"stdio"
				},
				on_attach = Lsp_keymap,
				capabilities = capabilities,
				root_dir = require('lspconfig').util.root_pattern("Gemfile", ".git", "."),
				filetypes = {"ruby"}
			})
		end,

		["rust_analyzer"] = function()
			require('lspconfig')["rust_analyzer"].setup({
				on_attach = Lsp_keymap,
				capabilities = capabilities,
				checkOnSave = true,
				check = {
					enable = true,
					command = "clippy",
					features = "all",
				}
			})
			Execute_keymap("<CMD>w<CR><CMD>below term cargo run<CR>")
		end
	}
})
