---------------------------------
-- Key bindings
---------------------------------
local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "

-- Vim
map("n", "<F5>", ":Neotree toggle<CR>", opts)
map("n", "<C-q>", ":q!<CR>", opts)
map("n", "<F4>", ":bd<CR>", opts)
map("n", "<F6>", ":sp<CR>:terminal<CR>", opts)
map("n", "<S-Tab>", "gT", opts)
map("n", "<Tab>", "gt", opts)
map("n", "<silent> <Tab>", ":tabnew<CR>", opts)
map("n", "<F12>", ":TSHighlightCapturesUnderCursor<CR>", opts)
map("n", "<C-p>", ':lua require("telescope.builtin").find_files()<CR>', opts)

-- Diagnostics
kmap("n", "<space>e", vim.diagnostic.open_float, opts)
kmap("n", "[d", vim.diagnostic.goto_prev, opts)
kmap("n", "]d", vim.diagnostic.goto_next, opts)
kmap("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	kmap("n", "gD", vim.lsp.buf.declaration, bufopts)
	kmap("n", "gd", vim.lsp.buf.definition, bufopts)
	kmap("n", "K", vim.lsp.buf.hover, bufopts)
	kmap("n", "gi", vim.lsp.buf.implementation, bufopts)
	kmap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	kmap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	kmap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	kmap("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	kmap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	kmap("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	kmap("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	kmap("n", "gr", vim.lsp.buf.references, bufopts)
	kmap("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

---------------------------------
-- Auto commands
---------------------------------
vim.cmd([[ autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync() ]])
vim.cmd([[ autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
vim.cmd([[ autocmd FileType php setl textwidth=120 softtabstop=4 shiftwidth=4 tabstop=4 colorcolumn=120]])
