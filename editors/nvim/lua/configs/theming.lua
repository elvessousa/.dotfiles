---------------------------------
-- Color scheme
---------------------------------
vim.cmd([[
  filetype plugin indent on
  syntax on
  colorscheme sobrio
]])

---------------------------------
-- Treesitter playground
---------------------------------
require("nvim-treesitter.configs").setup({
	playground = {
		disable = {},
		enable = true,
		persist_queries = false,
		updatetime = 25,
		keybindings = {
			focus_language = "f",
			goto_node = "<cr>",
			show_help = "?",
			toggle_anonymous_nodes = "a",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_language_display = "I",
			toggle_query_editor = "o",
			unfocus_language = "F",
			update = "R",
		},
	},
})

---------------------------------
-- Theming Utility
---------------------------------
local fn = vim.fn
local function get_color(group, attr)
	return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end
