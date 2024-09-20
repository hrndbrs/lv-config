lvim.plugins = {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    'simrat39/rust-tools.nvim',
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "MaximilianLloyd/ascii.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim"
    }
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    keys = {
      { "<leader>x",        desc = "Trouble" },
      { "<leader>x" .. "X", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Document diagnostics" },
      { "<leader>x" .. "x", "<CMD>Trouble diagnostics toggle<CR>",              desc = "Document diagnostics" },
      { "<leader>x" .. "q", "<CMD>Trouble quickfix toggle<CR>",                 desc = "Quickfix list (Trouble)" },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<C-e>"
      }
    }
  },
  {
    "Wansmer/treesj",
    keys = {
      {
        "<leader>m",
        "<CMD>TSJToggle<CR>",
        desc = "Toggle treesitter join"
      }
    },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    opts = { use_default_keymaps = false },
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "User FilePost",
    config = function(_, opts)
      require("colorizer").setup(opts)

      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  { 'marko-cerovac/material.nvim' },
  {
    "yuttie/comfortable-motion.vim",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "agoodshort/telescope-git-submodules.nvim",
        dependencies = "akinsho/toggleterm.nvim",
      },
    },
    config = function()
      require("telescope").load_extension("git_submodules")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {

    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          -- bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = false,
          lsp_doc_border = false,
        },
        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
      })
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require('nightfox').setup({
        options = {
          compile_path = vim.fn.stdpath("cache") .. "/nightfox",
          compile_file_suffix = "_compiled",
          transparent = true,
          terminal_colors = true,
          dim_inactive = false,
          module_default = true,
          colorblind = {
            enable = false,
            simulate_only = false,
            severity = {
              protan = 0,
              deutan = 0,
              tritan = 0,
            },
          },
          styles = {
            comments = "NONE",
            conditionals = "NONE",
            constants = "NONE",
            functions = "NONE",
            keywords = "NONE",
            numbers = "NONE",
            operators = "NONE",
            strings = "NONE",
            types = "NONE",
            variables = "NONE",
          },
          inverse = {
            match_paren = false,
            visual = false,
            search = false,
          },
        },
        palettes = {},
        specs = {},
        groups = {},
      })

      -- setup must be called before loading
    end
  }
}
