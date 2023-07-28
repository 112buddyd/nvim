local wk = require("which-key")

local maps = {
  n = {},
  i = {},
  v = {},
}

maps.n["j"] = { "v:count == 0 ? 'gj' : 'j'", "Move cursor down", expr = true, }
maps.n["k"] = { "v:count == 0 ? 'gk' : 'k'", "Move cursor up", expr = true, }
maps.n["<leader>w"] = { "<cmd>w<cr>", "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", "Quit" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", "New file" }
maps.n["<leader>c"] = { ":bd<cr>", "Close file" }
maps.n["<leader><TAB>"] = { ":bn<cr>", "Next file" }
maps.n["<leader><C-TAB>"] = { ":bp<cr>", "Prev file" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", "Force write" }
maps.n["<C-q>"] = { "<cmd>qa!<cr>", "Force quit" }
maps.n["|"] = { "<cmd>vsplit<cr>", "VSplit" }
maps.n["\\"] = { "<cmd>split<cr>", "HSplit" }

-- Plugin Manager
maps.n["<leader>p"] = { name = "Plugin Manager" }
maps.n["<leader>pi"] = { function() require("lazy").install() end, "Plugins Install" }
maps.n["<leader>ps"] = { function() require("lazy").home() end, "Plugins Status" }
maps.n["<leader>pS"] = { function() require("lazy").sync() end, "Plugins Sync" }
maps.n["<leader>pu"] = { function() require("lazy").check() end, "Plugins Check Updates" }
maps.n["<leader>pU"] = { function() require("lazy").update() end, "Plugins Update" }
maps.n["<leader>pm"] = { "<cmd>Mason<cr>", "Mason Installer" }
maps.n["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", "Mason Update" }

-- Comments
maps.n["<leader>/"] = {
  function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
  "Toggle comment line",
}
maps.v["<leader>/"] = {
  "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  "Toggle comment for selection",
}

-- Tabbing
maps.v["<S-Tab>"] = { "<gv", "Unindent line" }
maps.v["<Tab>"] = { ">gv", "Indent line" }

-- Docstrings
maps.n["<leader>a"] = { ":Neogen<cr>", "Docstrings" }

-- Git
maps.n["<leader>g"] = { name = "Git" }
maps.n["]g"] = { function() require("gitsigns").next_hunk() end, "Next Git hunk" }
maps.n["[g"] = { function() require("gitsigns").prev_hunk() end, "Previous Git hunk" }
maps.n["<leader>gl"] = { function() require("gitsigns").blame_line() end, "View Git blame" }
maps.n["<leader>gL"] = { function() require("gitsigns").blame_line { full = true } end, "View full Git blame" }
maps.n["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, "Preview Git hunk" }
maps.n["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, "Reset Git hunk" }
maps.n["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, "Reset Git buffer" }
maps.n["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, "Stage Git hunk" }
maps.n["<leader>gS"] = { function() require("gitsigns").stage_buffer() end, "Stage Git buffer" }
maps.n["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, "Unstage Git hunk" }
maps.n["<leader>gd"] = { function() require("gitsigns").diffthis() end, "View Git diff" }
maps.n["<leader>gg"] = { ":LazyGit<cr>", "LazyGit" }

-- File Explorer
maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", "Toggle Explorer" }
maps.n["<leader>o"] = {
  function()
    if vim.bo.filetype == "neo-tree" then
      vim.cmd.wincmd "p"
    else
      vim.cmd.Neotree "focus"
    end
  end,
  "Toggle Explorer Focus",
}

-- Telescope
maps.n["<leader>f"] = { name = "Find" }
maps.n["<leader>gb"] =
{ function() require("telescope.builtin").git_branches { use_file_path = true } end, "Git branches" }
maps.n["<leader>gc"] = {
  function() require("telescope.builtin").git_commits { use_file_path = true } end,
  "Git commits (repository)",
}
maps.n["<leader>gC"] = {
  function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
  "Git commits (current file)",
}
maps.n["<leader>gt"] =
{ function() require("telescope.builtin").git_status { use_file_path = true } end, "Git status" }
maps.n["<leader>f<CR>"] = { function() require("telescope.builtin").resume() end, "Resume previous search" }
maps.n["<leader>f'"] = { function() require("telescope.builtin").marks() end, "Find marks" }
maps.n["<leader>f/"] =
{ function() require("telescope.builtin").current_buffer_fuzzy_find() end, "Find words in current buffer" }
maps.n["<leader>fb"] = { function() require("telescope.builtin").buffers() end, "Find buffers" }
maps.n["<leader>fc"] = { function() require("telescope.builtin").grep_string() end, "Find word under cursor" }
maps.n["<leader>fC"] = { function() require("telescope.builtin").commands() end, "Find commands" }
maps.n["<leader>ff"] = { function() require("telescope.builtin").find_files() end, "Find files" }
maps.n["<leader>fF"] = {
  function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
  "Find all files",
}
maps.n["<leader>fh"] = { function() require("telescope.builtin").help_tags() end, "Find help" }
maps.n["<leader>fk"] = { function() require("telescope.builtin").keymaps() end, "Find keymaps" }
maps.n["<leader>fm"] = { function() require("telescope.builtin").man_pages() end, "Find man" }
maps.n["<leader>fo"] = { function() require("telescope.builtin").oldfiles() end, "Find history" }
maps.n["<leader>fr"] = { function() require("telescope.builtin").registers() end, "Find registers" }
maps.n["<leader>ft"] =
{ function() require("telescope.builtin").colorscheme { enable_preview = true } end, "Find themes" }
maps.n["<leader>fw"] = { function() require("telescope.builtin").live_grep() end, "Find words" }
maps.n["<leader>fW"] = {
  function()
    require("telescope.builtin").live_grep {
      additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
    }
  end,
  "Find words in all files",
}

-- LSP
maps.n["<leader>l"] = { name = "LSP" }
maps.n["<leader>ls"] = { function() require("telescope.builtin").lsp_document_symbols() end, "Search symbols" }

-- NVIM-DAP
maps.n["<leader>d"] = { name = "Debugger" }
maps.v["<leader>d"] = { name = "Debugger" }
-- modified function keys found with `showkey -a` in the terminal to get key code
-- run `nvim -V3log +quit` and search through the "Terminal info" in the `log` file for the correct keyname
maps.n["<F5>"] = { function() require("dap").continue() end, "Debugger: Start" }
maps.n["<F17>"] = { function() require("dap").terminate() end, "Debugger: Stop" } -- Shift+F5
maps.n["<F21>"] = {                                                               -- Shift+F9
  function()
    vim.ui.input({ prompt = "Condition: " }, function(condition)
      if condition then require("dap").set_breakpoint(condition) end
    end)
  end,
  "Debugger: Conditional Breakpoint",
}
maps.n["<F29>"] = { function() require("dap").restart_frame() end, "Debugger: Restart" } -- Control+F5
maps.n["<F6>"] = { function() require("dap").pause() end, "Debugger: Pause" }
maps.n["<F9>"] = { function() require("dap").toggle_breakpoint() end, "Debugger: Toggle Breakpoint" }
maps.n["<F10>"] = { function() require("dap").step_over() end, "Debugger: Step Over" }
maps.n["<F11>"] = { function() require("dap").step_into() end, "Debugger: Step Into" }
maps.n["<F23>"] = { function() require("dap").step_out() end, "Debugger: Step Out" } -- Shift+F11
maps.n["<leader>db"] = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint (F9)" }
maps.n["<leader>dB"] = { function() require("dap").clear_breakpoints() end, "Clear Breakpoints" }
maps.n["<leader>dc"] = { function() require("dap").continue() end, "Start/Continue (F5)" }
maps.n["<leader>dC"] = {
  function()
    vim.ui.input({ prompt = "Condition: " }, function(condition)
      if condition then require("dap").set_breakpoint(condition) end
    end)
  end,
  "Conditional Breakpoint (S-F9)",
}
maps.n["<leader>di"] = { function() require("dap").step_into() end, "Step Into (F11)" }
maps.n["<leader>do"] = { function() require("dap").step_over() end, "Step Over (F10)" }
maps.n["<leader>dO"] = { function() require("dap").step_out() end, "Step Out (S-F11)" }
maps.n["<leader>dq"] = { function() require("dap").close() end, "Close Session" }
maps.n["<leader>dQ"] = { function() require("dap").terminate() end, "Terminate Session (S-F5)" }
maps.n["<leader>dp"] = { function() require("dap").pause() end, "Pause (F6)" }
maps.n["<leader>dr"] = { function() require("dap").restart_frame() end, "Restart (C-F5)" }
maps.n["<leader>dR"] = { function() require("dap").repl.toggle() end, "Toggle REPL" }
maps.n["<leader>ds"] = { function() require("dap").run_to_cursor() end, "Run To Cursor" }
maps.n["<leader>dE"] = {
  function()
    vim.ui.input({ prompt = "Expression: " }, function(expr)
      if expr then require("dapui").eval(expr) end
    end)
  end,
  "Evaluate Input",
}
maps.v["<leader>dE"] = { function() require("dapui").eval() end, "Evaluate Input" }
maps.n["<leader>du"] = { function() require("dapui").toggle() end, "Toggle Debugger UI" }
maps.n["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, "Debugger Hover" }

-- Code Folding
maps.n["zR"] = { function() require("ufo").openAllFolds() end, "Open all folds" }
maps.n["zM"] = { function() require("ufo").closeAllFolds() end, "Close all folds" }
maps.n["zr"] = { function() require("ufo").openFoldsExceptKinds() end, "Fold less" }
maps.n["zm"] = { function() require("ufo").closeFoldsWith() end, "Fold more" }
maps.n["zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, "Peek fold" }


wk.register(maps.n, { mode = "n" })
wk.register(maps.i, { mode = "i" })
wk.register(maps.v, { mode = "v" })
