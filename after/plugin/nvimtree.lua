require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      webdev_colors = false,
      symlink_arrow = " ➜ ",
      show = {
        folder = false,
        file = false,
        folder_arrow = true,
        git = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "▸",
          arrow_open = "▾",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>N", vim.cmd.NvimTreeToggle)

