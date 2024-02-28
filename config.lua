-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- rd: https://discord.com/invite/Xb9B4Ny

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.encoding = "UTF-8"
vim.opt.shiftwidth = 2
vim.opt.textwidth = 80
vim.opt.expandtab = true


lvim.leader = "space"

reload("plugins")
reload("keymaps")

lvim.builtin.alpha.dashboard.section.header.val = {
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                     ]],
  [[       ████ ██████           █████      ██                     ]],
  [[      ███████████             █████                             ]],
  [[      █████████ ███████████████████ ███   ███████████   ]],
  [[     █████████  ███    █████████████ █████ ██████████████   ]],
  [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
  [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
  [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
  [[                                                                       ]],
  [[                                                                       ]],
  [[                                                                       ]],
}

-- Telescope
lvim.builtin.telescope.theme = "center"
lvim.builtin.telescope.defaults.file_ignore_patterns = { "node_modules" }

-- LSP Config
require("lvim.lsp.manager").setup("cssls", {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore"
      }
    },
  },
})

local lspconfig = require("lspconfig")
-- local configs = require("lspconfig/configs")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
        ["jsx.enabled"] = true,
        ["output.selfClosingStyle"] = "xml"
      },
    },
  }
})

-- Formatters & Linters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    args = { "--print-width", "100" },
    ---@usage only start in these filetypes, by default it will attach to all filetypes it supports
    filetypes = { "typescript", "typescriptreact", "css", "cssls", "vue" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  { name = "eslint_d" }
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  { name = "eslint_d" }
}

-- NvimTree
local nvimtree = lvim.builtin.nvimtree

nvimtree.setup.filters.custom = {}

-- Miscelaneous
local lualine = lvim.builtin.lualine
local bufferline = lvim.builtin.bufferline
-- lvim.colorscheme = "material-palenight"
lvim.colorscheme = "carbonfox"

lualine.style = "default"
lualine.sections.lualine_c = { "buffers" }
lualine.sections.lualine_x = { "diff", "encoding", "fileformat", "filetype" }

bufferline.active = false
