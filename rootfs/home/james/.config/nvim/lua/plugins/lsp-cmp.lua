return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = {
        { name = "nvim_lsp", priority = 100 },
        { name = "path" },
        { name = "spell" },
        { name = "treesitter" },
        { name = "nvim_lua" },
        { name = "buffer", priority = 1 },
      },
    })

    require('lsp_lines').setup()

    vim.diagnostic.config({ virtual_text = false })
  end
}
