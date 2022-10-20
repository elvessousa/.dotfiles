---------------------------------
-- Floating diagnostics message
---------------------------------
vim.diagnostic.config({
	float = { source = "always", border = border },
	virtual_text = false,
	signs = true,
})

local util = require("vim.lsp.util")

local formatting_callback = function(client, bufnr)
	vim.keymap.set("n", "<leader>f", function()
		local params = util.make_formatting_params({})
		client.request("textDocument/formatting", params, nil, bufnr)
	end, { buffer = bufnr })
end
