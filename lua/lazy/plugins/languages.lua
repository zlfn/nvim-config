return {
	-- extra syntax highlights for jsx & tsx
	--{"HerringtonDarkholme/yats.vim",
	--	dependencies = {
	--		"maxmellon/vim-jsx-pretty"
	--	}
	--},

	-- mason lsp and its config
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},

	-- clean lsp line
	{url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"},

	-- lsp for scala
	{"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim"
		}
	},

	-- completion engine
	{"hrsh7th/nvim-cmp"},
	{"hrsh7th/cmp-nvim-lsp"},
	{"hrsh7th/cmp-buffer"},
	{"hrsh7th/cmp-path"},
	{"hrsh7th/cmp-cmdline"},
	{"hrsh7th/vim-vsnip"},
	{"hrsh7th/cmp-vsnip"},

	-- treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}
