return {
	-- file explorer
	{"nvim-tree/nvim-tree.lua",
		dependencies={
			"nvim-tree/nvim-web-devicons",
		}
	},

	-- toggle terminal
	{"akinsho/toggleterm.nvim", config = true},

	-- windows
	{"anuvyklack/windows.nvim",
		dependencies={
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim"
		}
	},

	-- tabs
	{"romgrk/barbar.nvim",
		dependencies={
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		init = function() vim.g.barbar_auto_setup = false end,
	},

	--git
	{"kdheepak/lazygit.nvim",
		dependencies={
			"nvim-lua/plenary.nvim"
		}
	},

    -- auto close
	{"Townk/vim-autoclose"},
	{"windwp/nvim-ts-autotag",
		dependencies={
			"nvim-treesitter/nvim-treesitter"
		},
	}
}
