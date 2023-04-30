require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      webdev_colors = false,
      show = {
        folder = true,
        file = true,
        folder_arrow = false,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<leader>N", vim.cmd.NvimTreeToggle)

