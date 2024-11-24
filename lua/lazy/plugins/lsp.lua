return {
	-- neovim lsp config
	{"neovim/nvim-lspconfig",
		init_options = {
			userLanguages = {
				eelixir = "html-eex",
				eruby = "erb",
				rust = "html",
			},
		},
	},

	{"prabirshrestha/vim-lsp"},

	-- mason lsp and its config
	{"williamboman/mason.nvim",
		dependencies = {
			-- {"williamboman/mason-lspconfig.nvim"},
			{"vargasd/mason-lspconfig.nvim"},
			{"neovim/nvim-lspconfig"}
		}
	},
	
	-- nu
	{"LhKipp/nvim-nu"},

	-- clean lsp line
	{url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"},

	-- tailwind integration
	{"luckasRanarison/tailwind-tools.nvim",
		dependencies= {
			"nvim-treesitter/nvim-treesitter",
			"nvim-cmp",
			"onsails/lspkind-nvim"
		},
		opts = {}
	},

	-- completion engine
	{"hrsh7th/nvim-cmp",
		dependencies = {
			{"hrsh7th/cmp-nvim-lsp"},
			{"hrsh7th/cmp-buffer"},
			{"hrsh7th/cmp-path"},
			{"hrsh7th/cmp-cmdline"},
		}
	},

	{"hrsh7th/vim-vsnip",
		dependencies = {
			{"hrsh7th/cmp-vsnip"},
		}
	},

	-- treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
}
