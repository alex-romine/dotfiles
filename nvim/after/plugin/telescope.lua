local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})

local telescope = require('telescope')
telescope.setup {
    defaults = {
        file_ignore_patterns = {
            '.git/'
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            additional_args = function()
                return {"--hidden"}
            end
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
