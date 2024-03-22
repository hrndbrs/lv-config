local W = lvim.builtin.which_key.mappings
local keymaps = lvim.keys
local nmap = keymaps.normal_mode
local imap = keymaps.insert_mode
local tmap = keymaps.term_mode
local xmap = keymaps.visual_mode

lvim.builtin.terminal.open_mapping = "<C-t>"
vim.g.comfortable_motion_no_default_key_mappings = 1

W["e"] = {}
W["f"] = {}
W["ff"] = {
  "<CMD>Telescope find_files<CR>",
  "Find file"
}
W["fw"] = {
  "<CMD>Telescope live_grep<CR>",
  "Live grep"
}
W["hsp"] = {
  "<CMD>sp<CR>",
  "Horizontal split pane"
}
W["vsp"] = {
  "<CMD>vsp<CR>",
  "Vertical split pane"
}
W["sf"] = {}
W["gf"] = {
  function()
    vim.lsp.buf.format()
    vim.cmd.w()
  end,
  "Format and save"
}

-- Normal Mode
nmap["<Enter>"] = { ":", { desc = "Enter command mode" } }

nmap["<C-s>"] = { "<CMD>w<CR>", { desc = "Save current buffer" } }
nmap["<C-b>"] = { "<CMD>NvimTreeToggle<CR>", { desc = "Toggle file tree" } }
nmap["<C-p>"] = {
  "<CMD>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
  { desc = "Find file including dotfiles" }
}
nmap["<C-a>"] = { "ggVG", { desc = "Select all" } }

nmap["<C-k>"] = { "<CMD>call comfortable_motion#flick(-50)<CR>", { desc = "Scroll up" } }
nmap["<C-j>"] = { "<CMD>call comfortable_motion#flick(50)<CR>", { desc = "Scroll down" } }
nmap["<C-l>"] = { "<CMD>call comfortable_motion#flick(-150)<CR>", { desc = "Fast scroll up" } }
nmap["<C-h>"] = { "<CMD>call comfortable_motion#flick(150)<CR>", { desc = "Fast scroll down" } }

nmap["<Tab>"] = { "<CMD>bnext<CR>", { desc = "Next buffer" } }
nmap["<S-Tab>"] = { "<CMD>bprev<CR>", { desc = "Previous buffer" } }
nmap["<M-q>"] = { "<CMD>bp|bd #<CR>", { desc = "Close buffer" } }

nmap["<M-d>"] = { ":%s/", { desc = "Find and replace" } }
nmap["<C-d>"] = { "*:%s//", { desc = "Replace current word" } }
nmap["<M-z>"] = { "<CMD>set wrap!<CR>", { desc = "Toggle text wrap" } }

nmap["<Esc>"] = { "<CMD>nohlsearch|NoiceDismiss<CR>", { desc = "Dismiss notification" } }

nmap["<M-S-K>"] = { "yyP", { desc = "Copy line up" } }
nmap["<M-S-J>"] = { "yyp", { desc = "Copy line down" } }
nmap["<M-S-O>"] = { "O<Esc>", { desc = "Insert line up" } }
nmap["<M-o>"] = { "o<Esc>", { desc = "Insert line down" } }

nmap["d<Enter>"] = { "cc<Esc>", { desc = "Delete current line" } }

-- Insert Mode
imap["<C-s>"] = { "<CMD>w<CR>", { desc = "Save current buffer" } }

imap["<C-b>"] = { "<ESC>^i", { desc = "Go to line start" } }
imap["<C-e>"] = { "<End>", { desc = "Go to line end" } }

imap["<C-k>"] = { "<Up>", { desc = "Insert mode navigation : up" } }
imap["<C-j>"] = { "<Down>", { desc = "Insert mode navigation : down" } }
imap["<C-h>"] = { "<Left>", { desc = "Insert mode navigation : left" } }
imap["<C-l>"] = { "<Right>", { desc = "Insert mode navigation : right" } }

imap["<M-S-O>"] = { "<Esc>O", { desc = "Insert line up" } }
imap["<M-o>"] = { "<Esc>o", { desc = "Insert line down" } }

-- Visual Mode

xmap["<leader>p"] = { "\"_dP", { desc = "Replace highlighted words with registered entry" } }

-- Terminal Mode
tmap["<leader><Esc>"] = { "<C-\\><C-n>", { desc = "Exit terminal mode" } }
