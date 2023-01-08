local fzf = require('fzf-lua')
vim.keymap.set('n', '<C-f>', fzf.files)
vim.keymap.set('n', '<leader><space>', fzf.buffers)
vim.keymap.set('n', '<leader>?', fzf.oldfiles)
vim.keymap.set('n', '<leader>sg', fzf.live_grep)

