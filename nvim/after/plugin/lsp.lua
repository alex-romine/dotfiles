local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'ansiblels',
    'bashls',
    'docker_compose_language_service',
    'dockerls',
    -- 'gopls',
    'jsonls',
    'lua_ls',
    'pylsp',
    -- 'pyright',
    'terraformls',
    'tflint',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

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

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.setup({capabilities = capabilities})

vim.diagnostic.config({
    virtual_text = true
})
