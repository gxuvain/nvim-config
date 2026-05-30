vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/dmmulroy/ts-error-translator.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
})

vim.cmd.colorscheme "minischeme"

require("mini.ai").setup()

require("mini.bufremove").setup()
vim.keymap.set("n", "ba", "<Cmd>b#<CR>")
vim.keymap.set("n", "bd", "<Cmd>lua MiniBufremove.delete()<CR>")

require("mini.cmdline").setup()
require("mini.completion").setup()
require("mini.diff").setup()
require("mini.extra").setup()

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", "<Cmd>lua MiniFiles.open()<CR>")

require("mini.hipatterns").setup({
  highlighters = {
    fixme     = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack      = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo      = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note      = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
  },
})

require("mini.icons").setup()
require("mini.indentscope").setup()

local map_multistep = require("mini.keymap").map_multistep

map_multistep("i", "<Tab>", { "minisnippets_next", "pmenu_next", "minisnippets_expand" })
map_multistep("i", "<S-Tab>", { "minisnippets_prev", "pmenu_prev" })
map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
map_multistep("i", "<BS>", { "minipairs_bs" })

require("mini.move").setup({
  mappings = {
    left       = "<leader>mh",
    right      = "<leader>ml",
    down       = "<leader>mj",
    up         = "<leader>mk",
    line_left  = "<leader>mh",
    line_right = "<leader>ml",
    line_down  = "<leader>mj",
    line_up    = "<leader>mk",
  },
})

require("mini.notify").setup()
require("mini.pairs").setup()

require("mini.pick").setup()
vim.keymap.set("n", "<leader>ff", "<Cmd>Pick files<CR>")
vim.keymap.set("n", "<leader>fb", "<Cmd>Pick buffers<CR>")
vim.keymap.set("n", "<leader>fg", "<Cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fh", "<Cmd>Pick help<CR>")
vim.keymap.set("n", "<leader>fc", "<Cmd>Pick colorschemes<CR>")

require("mini.sessions").setup()
require("mini.starter").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()

require("nvim-treesitter").install({
  "lua",
  "markdown",
  "html",
  "css",
  "javascript",
  "typescript",
  "jsx",
  "tsx",
  "json",
  "yaml",
  "ocaml"
})

local servers = {
  "lua_ls",
  "ts_ls",
  "oxlint",
  "oxfmt",
  "jsonls"
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers
})

vim.diagnostic.config({
  virtual_text = true,
})

require("conform").setup({
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  formatters_by_ft = {
    javascript = { "oxfmt" },
    javascriptreact = { "oxfmt" },
    typescript = { "oxfmt" },
    typescriptreact = { "oxfmt" },
    json = { "oxfmt" },
    vue = { "oxfmt" },
  },
})

require("ts-error-translator").setup()

require("nvim-ts-autotag").setup()
