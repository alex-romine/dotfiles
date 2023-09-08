local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
    'ansiblels',
    'bashls',
    'docker_compose_language_service',
    'dockerls',
    -- 'gopls',
    'jsonls',
    'lua_ls',
    'pyright',
    'terraformls',
    'tflint',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

-- Mappings for completions
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<CR>'] = cmp.mapping.confirm({select = false}),
  ["<C-Space>"] = cmp.mapping.complete(),

})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- lsp preferences
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
