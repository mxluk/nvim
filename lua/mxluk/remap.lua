vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set('n', '<leader>tg', function()
    local word = vim.fn.expand('<cword>')
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line_num = cursor_pos[1]

    -- Replace the word with HTML tags
    vim.api.nvim_command('normal ciw<' .. word .. '></' .. word .. '>')

    -- Calculate the new cursor position, right after the opening tag
    local new_col_pos = cursor_pos[2] - #word + #('<' .. word .. '>') + 1

    -- Set the cursor position and enter insert mode
    vim.api.nvim_win_set_cursor(0, {line_num, new_col_pos})
    vim.api.nvim_command('startinsert')
end)
vim.keymap.set('n', '<leader>th', function()
    local word = vim.fn.expand('<cword>')
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line_num = cursor_pos[1]
    local indent = string.rep(" ", vim.fn.indent(line_num))

    -- Replace the word with HTML tags and two line breaks
    vim.api.nvim_command('normal ciw<' .. word .. '>\n' .. indent .. '    \n' .. indent .. '</' .. word .. '>')

    -- Calculate the new cursor position at the indented empty line
    local new_line_num = line_num + 1
    local new_col_pos = #indent + 4 -- 4 spaces for the additional indentation

    -- Set the cursor position and enter insert mode
    vim.api.nvim_win_set_cursor(0, {new_line_num, new_col_pos})
    vim.api.nvim_command('startinsert')
end)
