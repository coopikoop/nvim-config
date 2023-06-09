-- Highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual" })
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

local remember_folds_id = vim.api.nvim_create_augroup("remember_folds", { clear = false })
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
    pattern = "?*",
    group = remember_folds_id,
    callback = function()
        vim.cmd([[silent! mkview 1]])
    end,
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    pattern = "?*",
    group = remember_folds_id,
    callback = function()
        vim.cmd([[silent! loadview 1]])
    end,
})

-- fix tab in python
--[[
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.cpp" },
    callback = function()
        vim.cmd("setlocal noexpandtab")
    end,
})
--]]

-- fix comment
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd([[set formatoptions-=cro]])
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "" },
    callback = function()
        local get_project_dir = function()
            local cwd = vim.fn.getcwd()
            local project_dir = vim.split(cwd, "/")
            local project_name = project_dir[#project_dir]
            return project_name
        end

        vim.opt.titlestring = get_project_dir()
    end,
})

-- clear cmd output
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    callback = function()
        vim.cmd([[echon '']])
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "help" },
    callback = function()
        vim.cmd([[wincmd L]])
    end,
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
    pattern = { "*" },
    callback = function()
        vim.opt_local["number"] = false
        vim.opt_local["signcolumn"] = "no"
        vim.opt_local["foldcolumn"] = "0"
    end,
})

-- fix comment on new line
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd([[set formatoptions-=cro]])
    end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    callback = function()
        local util = require("coop.util")
        util.set_root(util.get_root())
        return true
    end,
})

