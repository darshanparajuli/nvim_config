require('blink.cmp').setup({
  keymap = {
    preset = 'none',
    ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
    ['<C-n>'] = { 'show', 'select_next', 'fallback' },
    ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
    ['<Tab>'] = { 'select_next', 'accept', 'fallback' },
    ['<CR>'] = { 'accept', 'fallback' },
    ["<C-up>"] = { "scroll_documentation_up", "fallback" },
    ["<C-down>"] = { "scroll_documentation_down", "fallback" },
  },
  completion = {
    menu = {
      auto_show = false,
    },
    ghost_text = {
      enabled = true,
    },
    documentation = {
      auto_show = false,
    },
    keyword = {
      range = 'prefix',
    },
    trigger = {
      show_on_blocked_trigger_characters = { ' ', '\n', '\t', '.' },
    },
  },
  cmdline = {
    enabled = true,
    completion = {
      menu = {
        auto_show = false
      },
    },
    keymap = {
      preset = 'none',
      ['<C-n>'] = { 'show', 'select_next', 'fallback' },
      ['<C-p>'] = { 'show', 'select_prev', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },
    },
  },
})


