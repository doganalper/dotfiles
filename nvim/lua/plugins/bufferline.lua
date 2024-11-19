return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  enabled = false,
  config = function()
    require("bufferline").setup({
      options = {
        themable = false,
        separator_style = "thick",
        offsets = {
          {
            filetype = "neo-tree",
            text = "NeoTree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
  end,
}
