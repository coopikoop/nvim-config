local options = {
    backup = false, -- creates a backup file
    clipboard = "unnamedplus", -- allows neovim to access the system clipboard
    cmdheight = 0, -- more space in the neovim command line for displaying messages
    completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0, -- so that `` is visible in markdown files
    fileencoding = "utf-8", -- the encoding written to a file
    incsearch = true,
    hlsearch = true, -- highlight all matches on previous search pattern
    inccommand = "nosplit",
    ignorecase = true, -- ignore case in search patterns
    grepformat = "%f:%l:%c:%m",
    grepprg = "rg --vimgrep",
    mouse = "a", -- allow the mouse to be used in neovim
    pumheight = 10, -- pop up menu height
    showmode = true,
    showtabline = 2, -- always show tabs
    -- smartcase = true,                                                -- smart case
    smartindent = true, -- make indenting smarter again
    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window
    swapfile = false, -- creates a swapfile
    termguicolors = true, -- set term gui colors (most terminals support this)
    timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
    -- undofile = true,                                                 -- enable persistent undo
    updatetime = 2000, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = true, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 2 {default 4}
    signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    -- scrolloff = 6,
    -- sidescrolloff = 8,
    laststatus = 3,
    -- guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
    -- guicursor = "a:xxx",
    background = "dark",
    selection = "inclusive",
    virtualedit = "onemore",
    showcmd = false,
    title = true,
    titlestring = "%<%F%=%l/%L - nvim",
    linespace = 8,
    mousemoveevent = true,
    syntax = "on",
    spelllang = { "en" },
    -- use fold
    foldlevelstart = 99,
    foldlevel = 99,
    foldenable = true,
    foldcolumn = "1",
    fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:>]],
    -- session
    sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.opt.shortmess:append("c")

vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,]")
vim.cmd([[set iskeyword+=-]])
-- diable open fold with `l`
vim.cmd([[set foldopen-=hor]])

if vim.g.neovide then
    vim.opt.guifont = "FiraCode Nerd Font Mono:h10" -- the font used in graphical neovim applications
    vim.g.neovide_scale_factor = 1
end

