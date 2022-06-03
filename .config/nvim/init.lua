require('plugins')

local opts = { noremap = true, silent = true }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Set colorscheme
vim.g.tokyonight_style = 'night'
vim.cmd[[colorscheme tokyonight]]

vim.opt.number = true -- show line numbers
vim.opt.termguicolors = true -- 24-bit RGB colors
vim.g.mapleader = ' ' -- leader key
-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Turn off arrow keys
vim.keymap.set({'', 'i'}, '<Up>', '<Nop>', opts)
vim.keymap.set({'', 'i'}, '<Down>', '<Nop>', opts)
vim.keymap.set({'', 'i'}, '<Left>', '<Nop>', opts)
vim.keymap.set({'', 'i'}, '<Right>', '<Nop>', opts)

-- Lualine
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}

-- LSP
local lsp_opts = { buffer = 0, noremap = true, silent = true }

local on_attach = function()
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, lsp_opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, lsp_opts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, lsp_opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, lsp_opts)
end

local servers = { 'gopls', 'tsserver' }
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
end
-- Sumneko_lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Telescope
require('telescope').load_extension('fzf')
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, opts)

-- Setup nvim-cmp.
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
        { name = 'path' },
    })
})
