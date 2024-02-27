lvim.builtin.which_key.mappings["e"] = {}
lvim.builtin.which_key.mappings["hsp"] = {
  "<CMD>sp<CR>",
  "Horizontal split"
}
lvim.builtin.which_key.mappings["vsp"] = {
  "<CMD>vsp<CR>",
  "Vertical split"
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
lvim.keys.normal_mode["<C-b>"] = "<CMD>NvimTreeToggle<CR>"
lvim.keys.normal_mode["<C-p>"] = "<CMD>Telescope find_files<CR>"
lvim.keys.normal_mode["<C-a>"] = "ggVG"

lvim.keys.normal_mode["<C-k>"] = "<CMD>call comfortable_motion#flick(-50)<CR>"
lvim.keys.normal_mode["<C-j>"] = "<CMD>call comfortable_motion#flick(50)<CR>"
lvim.keys.normal_mode["<C-h>"] = "<CMD>call comfortable_motion#flick(-150)<CR>"
lvim.keys.normal_mode["<C-l>"] = "<CMD>call comfortable_motion#flick(150)<CR>"

lvim.keys.normal_mode["<M-w>"] = "<CMD>bprev<CR>"
lvim.keys.normal_mode["<M-e>"] = "<CMD>bnext<CR>"
lvim.keys.normal_mode["<M-q>"] = "<CMD>bp|bd #<CR>"

lvim.keys.normal_mode["<M-d>"] = ":%s/"
lvim.keys.normal_mode["<M-z>"] = "<CMD>set wrap!<CR>"

lvim.keys.normal_mode["<leader><Esc>"] = "<CMD>nohlsearch|NoiceDismiss<CR>"

lvim.keys.normal_mode["<M-S-K>"] = "yyP"
lvim.keys.normal_mode["<M-S-J>"] = "yyp"

-- Terminal Mode
lvim.keys.term_mode["<Esc>"] = "<C-\\><C-n>"
