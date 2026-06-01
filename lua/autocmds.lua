vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
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
  },
  callback = function(ev)
    vim.treesitter.start(ev.buf)
  end
})
