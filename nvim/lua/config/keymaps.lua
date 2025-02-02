-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set leader key to `space`
vim.g.mapleader = " "

-- For conciseness
local keymap = vim.keymap
local opts = {
  noremap = true,
  silent = true,
}

-- Decrement/Increment
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- Split window
keymap.set("n", "<leader>ss", ":split<Return>", opts) -- Horizontal split
keymap.set("n", "<leader>sv", ":vsplit<Return>", opts) -- Vertical split
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close split window

-- Resize widnow
keymap.set("n", "<leader><down>", "<C-w>-") -- make split window height shorter
keymap.set("n", "<leader><up>", "<C-w>+") -- make split windows height taller
keymap.set("n", "<leader><right>", "<C-w>>5") -- make split windows width bigger
keymap.set("n", "<leader><left>", "<C-w><5") -- make split windows width smaller

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

--- Example integration with Tabnine and LuaSnip; falling back to inserting tab if neither has a completion
vim.keymap.set("i", "<C-]>", function()
  if require("tabnine.keymaps").has_suggestion() then
    return require("tabnine.keymaps").accept_suggestion()
  elseif require("luasnip").jumpable(1) then
    return require("luasnip").jump(1)
  else
    return "<C-]>"
  end
end, { expr = true })
