local M = {}

M.on_attach = function(_, buffer)
    local gs = package.loaded.gitsigns
    local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = buffer
        vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]c", function()
        if vim.wo.diff then
            return "]c"
        end
        vim.schedule(function()
            gs.next_hunk()
        end)
        return "<Ignore>"
    end, { expr = true })

    map("n", "[c", function()
        if vim.wo.diff then
            return "[c"
        end
        vim.schedule(function()
            gs.prev_hunk()
        end)
        return "<Ignore>"
    end, { expr = true })

    -- Actions
    map({ "n", "v" }, "<leader>Gs", ":Gitsigns stage_hunk<CR>", {desc = "Stage hunk"})
    map({ "n", "v" }, "<leader>Gr", ":Gitsigns reset_hunk<CR>", {desc = "Reset hunk"})
    map("n", "<leader>GS", gs.stage_buffer, {desc = "Stage buffer"})
    map("n", "<leader>Gu", gs.undo_stage_hunk, {desc = "Stage hunk"})
    map("n", "<leader>GR", gs.reset_buffer, {desc = "Reset buffer"})
    map("n", "<leader>Gp", gs.preview_hunk, {desc = "Preview hunk"})
    map("n", "<leader>GB", function()
        gs.blame_line({ full = true })
    end, {desc = "Blame line, show full message"})
    map("n", "<leader>Gb", gs.toggle_current_line_blame, {desc = "Toggle current line blame"})
    map("n", "<leader>Gd", gs.diffthis, {desc = "Diff this against index"})
    map("n", "<leader>GD", function()
        gs.diffthis("~")
    end, {desc = "Diff this against last commit"})
    map("n", "<leader>GD", gs.toggle_deleted, {desc = "Toggle deleted"})

    -- Text object
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end

return M

