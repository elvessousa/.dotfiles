---------------------------------
-- Plugins
---------------------------------
local packer = require("packer")
vim.cmd([[packadd packer.nvim]])

packer.startup(function()
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/nvim-cmp")
	-- Snippet engine
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	-- Formatting
	use("jose-elias-alvarez/null-ls.nvim")
	-- Language servers
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("simrat39/rust-tools.nvim")
	-- Syntax parser
	use("nvim-treesitter/nvim-treesitter")
	use("nvim-treesitter/playground")
	use("wuelnerdotexe/vim-astro")
	-- Plugin manager
	use("wbthomason/packer.nvim")
	-- Utilities
	use("windwp/nvim-autopairs")
	use("norcalli/nvim-colorizer.lua")
	use("lewis6991/gitsigns.nvim")
	-- Dependences needed
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("MunifTanjim/nui.nvim")
	-- Finder
	use("nvim-telescope/telescope.nvim")
	-- Interface
	use("akinsho/bufferline.nvim")
	use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" })
	use("nvim-lualine/lualine.nvim")
	-- use('elvessousa/sobrio')
end)

---------------------------------
-- Misc plugins
---------------------------------
-- Autopairs
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
})

-- LSP Installer
require("mason").setup()

-- Colorizer
require("colorizer").setup()

-- Git signs
require("gitsigns").setup()

-- Bufferline
require("bufferline").setup()

-- Lualine
require("lualine").setup()

-- Neo tree
require("neo-tree").setup({
	-- Close Neo-tree if it is the last window left in the tab
	close_if_last_window = false,
	enable_diagnostics = true,
	enable_git_status = true,
	popup_border_style = "rounded",
	sort_case_insensitive = false,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
	window = { width = 30 },
})
