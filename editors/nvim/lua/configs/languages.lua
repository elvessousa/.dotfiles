---------------------------------
-- Language servers
---------------------------------
local lspconfig = require("lspconfig")
local caps = vim.lsp.protocol.make_client_capabilities()
local no_format = function(client, bufnr)
	client.server_capabilities.document_formatting = false
end

-- Capabilities
caps.textDocument.completion.completionItem.snippetSupport = true

-- Astro
lspconfig.astro.setup({ capabilities = caps })

-- Python
lspconfig.pyright.setup({ capabilities = caps, on_attach = no_format })

-- PHP
lspconfig.phpactor.setup({ capabilities = caps })

-- JavaScript/Typescript
lspconfig.tsserver.setup({ capabilities = caps, on_attach = no_format })

-- Rust
lspconfig.rust_analyzer.setup({
	capabilities = caps,
	on_attach = function(client, bufnr)
		--formatting_callback(client, bufnr)
		common_on_attach(client, bufnr)
	end,
})

-- Emmet
lspconfig.emmet_ls.setup({
	capabilities = snip_caps,
	filetypes = {
		"css",
		"html",
		"javascriptreact",
		"less",
		"sass",
		"scss",
		"typescriptreact",
	},
})

---------------------------------
-- Rust tools
---------------------------------
local rust_tools = require("rust-tools")

rust_tools.setup({
	server = {
		on_attach = function(client, bufnr)
			vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<Leader>a", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
			client.server_capabilities.document_formatting = false
			client.server_capabilities.document_range_formatting = false
		end,
	},
	inlay_hints = {
		auto = true,
		only_current_line = false,
		max_len_align = false,
		max_len_align_padding = 1,
		right_align = false,
		right_align_padding = 7,
		highlight = "Comment",
	},
})
