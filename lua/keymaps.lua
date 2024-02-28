lvim.builtin.which_key.mappings["e"] = {}
lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["fw"] = {
  "<CMD>Telescope live_grep<CR>",
  "Live grep"
}
lvim.builtin.which_key.mappings["hsp"] = {
  "<CMD>sp<CR>",
  "Horizontal split pane"
}
lvim.builtin.which_key.mappings["vsp"] = {
  "<CMD>vsp<CR>",
  "Vertical split pane"
}
lvim.builtin.which_key.mappings["sf"] = {}
lvim.builtin.which_key.mappings["gf"] = {
  function()
    vim.lsp.buf.format()
    vim.cmd.w()
  end,
  "Format and save"
}
lvim.builtin.terminal.open_mapping = "<C-t>"
vim.g.comfortable_motion_no_default_key_mappings = 1


-- Normal Mode
lvim.keys.normal_mode["<C-s>"] = { "<CMD>w<CR>", { desc = "Save current buffer" } }
lvim.keys.normal_mode["<C-b>"] = { "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file tree" } }
lvim.keys.normal_mode["<C-p>"] = { "<CMD>Telescope find_files<CR>", { desc = "Find file" } }
lvim.keys.normal_mode["<C-a>"] = { "ggVG", { desc = "Select all" } }

lvim.keys.normal_mode["<C-k>"] = { "<CMD>call comfortable_motion#flick(-50)<CR>", { desc = "Scroll up" } }
lvim.keys.normal_mode["<C-j>"] = { "<CMD>call comfortable_motion#flick(50)<CR>", { desc = "Scroll down" } }
lvim.keys.normal_mode["<C-l>"] = { "<CMD>call comfortable_motion#flick(-150)<CR>", { desc = "Fast scroll up" } }
lvim.keys.normal_mode["<C-h>"] = { "<CMD>call comfortable_motion#flick(150)<CR>", { desc = "Fast scroll down" } }

lvim.keys.normal_mode["<Tab>"] = { "<CMD>bnext<CR>", { desc = "Next buffer" } }
lvim.keys.normal_mode["<S-Tab>"] = { "<CMD>bprev<CR>", { desc = "Previous buffer" } }
lvim.keys.normal_mode["<M-q>"] = { "<CMD>bp|bd #<CR>", { desc = "Close buffer" } }

lvim.keys.normal_mode["<M-d>"] = { ":%s/", { desc = "Find and replace" } }
lvim.keys.normal_mode["<M-z>"] = { "<CMD>set wrap!<CR>", { desc = "Toggle text wrap" } }

lvim.keys.normal_mode["<Esc>"] = { "<CMD>nohlsearch|NoiceDismiss<CR>", { desc = "Dismiss notification" } }

lvim.keys.normal_mode["<M-S-K>"] = { "yyP", { desc = "Copy line up" } }
lvim.keys.normal_mode["<M-S-J>"] = { "yyp", { desc = "Copy line down" } }
lvim.keys.normal_mode["<M-S-O>"] = { "O<Esc>", { desc = "Insert line up" } }
lvim.keys.normal_mode["<M-o>"] = { "o<Esc>", { desc = "Insert line down" } }

-- Insert Mode
lvim.keys.insert_mode["<C-s>"] = { "<CMD>w<CR>", { desc = "Save current buffer" } }

lvim.keys.insert_mode["<C-b>"] = { "<ESC>^i", { desc = "Go to line start" } }
lvim.keys.insert_mode["<C-e>"] = { "<End>", { desc = "Go to line end" } }

lvim.keys.insert_mode["<C-k>"] = { "<Up>", { desc = "Insert mode navigation : up" } }
lvim.keys.insert_mode["<C-j>"] = { "<Down>", { desc = "Insert mode navigation : down" } }
lvim.keys.insert_mode["<C-h>"] = { "<Left>", { desc = "Insert mode navigation : left" } }
lvim.keys.insert_mode["<C-l>"] = { "<Right>", { desc = "Insert mode navigation : right" } }

lvim.keys.insert_mode["<M-S-O>"] = { "<Esc>O", { desc = "Insert line up" } }
lvim.keys.insert_mode["<M-o>"] = { "<Esc>o", { desc = "Insert line down" } }

-- Terminal Mode
lvim.keys.term_mode["<leader><Esc>"] = { "<C-\\><C-n>", { desc = "Exit terminal mode" } }
