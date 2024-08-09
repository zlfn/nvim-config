return {
	-- file explorer
	{"nvim-tree/nvim-tree.lua"},
	{"nvim-tree/nvim-web-devicons"},

	-- windows
	{"anuvyklack/windows.nvim",
		dependencies={
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim"
		}
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
		}
	}
}
