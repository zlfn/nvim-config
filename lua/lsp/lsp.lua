require('mason').setup()
require('keymap')
require("lsp_lines").setup()

vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {only_current_line = true}
})

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
				on_attach = Lsp_keymap,
				capabilities = capabilities,
				root_dir = require('lspconfig').util.root_pattern("Gemfile", ".git", "."),
				filetypes = {"ruby"},
				settings = {
					solargraph = {
						completion = true,
						autoformat = false,
						formatting = true,
						symbols = true,
						definitions = true,
						references = true,
						folding = true,
						highlights = true,
						diagnostics = true,
						rename = true,
					}
				}
			})
		end,

		["denols"] = function()
			require('lspconfig')["denols"].setup({
				on_attach = Lsp_keymap,
				capabilities = capabilities,
				root_dir = require('lspconfig').util.root_pattern("dev.ts", "deno.json"),
			})
		end,

		["unocss"] = function()
			require('lspconfig')["unocss"].setup({
				on_attach = Lsp_keymap,
				capabilities = capabilities,
				root_dir = require('lspconfig').util.root_pattern("uno.config.ts"),
			})
		end,

		["rust_analyzer"] = function()
			require('lspconfig')["rust_analyzer"].setup({
				on_attach = Lsp_keymap,
				capabilities = capabilities,
				checkOnSave = true,
				check = {
					enable = true,
					command = "cargo check",
					features = "all",
				},
				settings = {
					["rust-analyzer"] = {
						["cargo"] = {
							["allFeatures"] = true
						},
					},
				},
			})
			Execute_keymap("<CMD>w<CR><CMD>below term cargo run<CR>")
		end,
	}
})
