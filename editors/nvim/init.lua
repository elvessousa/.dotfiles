-- Options
local set = vim.opt

set.background = 'dark'
set.clipboard = 'unnamedplus'
set.completeopt = 'noinsert,menuone,noselect'
set.cursorline = true
set.expandtab = true
set.foldexpr = 'nvim_treesitter#foldexpr()'
set.foldmethod = 'manual'
set.hidden = true
set.inccommand = 'split'
set.mouse = 'a'
set.number = true
set.relativenumber = true
set.shiftwidth = 2
set.smarttab = true
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.tabstop = 2
set.termguicolors = true
set.title = true
set.ttimeoutlen = 0
set.wildmenu = true
set.wrap = true

-- Color scheme
vim.cmd [[
  filetype plugin indent on
  syntax on
  colorscheme sobrio_ghost
]]

-- Plugins
local packer = require('packer')
vim.cmd [[packadd packer.nvim]]

packer.startup(function()
  -- use 'elvessousa/sobrio'
  -- Completion
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  -- Snippet engine
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  -- Formatting
  use 'jose-elias-alvarez/null-ls.nvim'
  -- Language servers
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  -- Syntax parser
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'
  -- Plugin manager
  use 'wbthomason/packer.nvim'
  -- Utilities
  use 'windwp/nvim-autopairs'
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- Interface
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    requires = { 
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end)

-- Autopairs
require("nvim-autopairs").setup { 
  disable_filetype = { 'TelescopePrompt' }
} 

-- Git signs
require('gitsigns').setup()

-- Bufferline
require("bufferline").setup{}

-- Lualine
require('lualine').setup({
  globalstatus = false,
})

-- Neo tree
require('neo-tree').setup({
  -- Close Neo-tree if it is the last window left in the tab
  close_if_last_window = false, 
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sort_case_insensitive = false,
  window = { width = 30 },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    }
  }
})

-- Syntax highlighting
require('nvim-treesitter.configs').setup {
  ensure_installed = { 
    'bash',
    'c',
    'cpp',
    'css',
    'elixir',
    'fish',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline',
    'php',
    'python',
    'regex',
    'ruby',
    'rust',
    'scss',
    'sql',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  highlight = { enable = true, },
  indent = { enable = true, },
  autotag = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'javascriptreact',
      'svelte',
      'typescript',
      'typescriptreact',
      'vue',
      'xml',
    }
  }
}

-- Treesitter playground
require("nvim-treesitter.configs").setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, 
    persist_queries = false,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- Completion
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), 
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, 
    { name = 'luasnip' }, 
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, 
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Language servers
require('lspconfig')['pyright'].setup { capabilities = capabilities }
require('lspconfig')['tsserver'].setup { 
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
}
require('lspconfig')['rust_analyzer'].setup { capabilities = capabilities }

-- Formatting
local formatting = require("null-ls").builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

require("null-ls").setup({
  sources = {
    formatting.black,
    formatting.rustfmt,
    formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.name == 'tsserver' then 
      client.resolved_capabilities.document_formatting = false
    end

    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        -- buffer = bufnr,
        callback = function()
            vim.lsp.buf.formatting()
        end,
      })
    end
  end,
})

-- Theming Utility
local fn = vim.fn
local function get_color(group, attr)
    return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
end

-- Key bindings
local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = ' ' 

-- Vim
map('n', '<F5>', ':Neotree toggle<CR>', opts)
map('n', '<C-q>', ':q!<CR>', opts)
map('n', '<F4>', ':bd<CR>', opts)
map('n', '<F6>', ':sp<CR>:terminal<CR>', opts)
map('n', '<S-Tab>', 'gT', opts)
map('n', '<Tab>', 'gt', opts)
map('n', '<silent> <Tab>', ':tabnew<CR>', opts)
map('n', '<F12>', ':TSHighlightCapturesUnderCursor<CR>', opts)
map('n', '<C-p>', ':lua require("telescope.builtin").find_files()<CR>', opts)

-- Diagnostics
kmap('n', '<space>e', vim.diagnostic.open_float, opts)
kmap('n', '[d', vim.diagnostic.goto_prev, opts)
kmap('n', ']d', vim.diagnostic.goto_next, opts)
kmap('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  kmap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  kmap('n', 'gd', vim.lsp.buf.definition, bufopts)
  kmap('n', 'K', vim.lsp.buf.hover, bufopts)
  kmap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  kmap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  kmap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  kmap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  kmap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  kmap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  kmap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  kmap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  kmap('n', 'gr', vim.lsp.buf.references, bufopts)
  kmap('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

vim.cmd [[
  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()<CR>
]]
