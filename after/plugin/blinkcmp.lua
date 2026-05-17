require('blink.cmp').setup({
  keymap = {
    preset = 'none',
    ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-n>'] = { 'select_next', 'fallback' },
    ['<C-p>'] = { 'select_prev', 'fallback' },
    ['<Tab>'] = { 'select_next', 'accept', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
  },
  completion = {
    menu = { auto_show = false },
    ghost_text = { enabled = true },
    documentation = { auto_show = false },
  },
  cmdline = {
    completion = { menu = { auto_show = false } }
  },
})


