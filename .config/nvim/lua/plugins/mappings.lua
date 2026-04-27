return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<S-l>"] = { "<cmd>bnext<CR>", desc = "Next buffer" },
          ["<S-h>"] = { "<cmd>bprevious<CR>", desc = "Prev buffer" },

          ["gd"] = { function() vim.lsp.buf.definition() end, desc = "Go to Definition" },

        },
      },
    },
  },
}
