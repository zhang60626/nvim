-- :help options
local options = {
    -- indent options
    -- convert tabs to spaces
    expandtab = true,
    -- the number of spaces inserted for each indentation
    shiftwidth = 4,
    -- insert 4 spaces for a tab
    tabstop = 4,
    -- insert tabstop number of spacs when the tab key is pressed
    smarttab = true,
    -- New lines inherit the indentation of previous lines
    smartindent = true,

    -- search options
    -- highlight all matches on previous search pattern
    hlsearch = true,
    -- ignore case in search patterns
    ignorecase = true,
    -- incremental search that shows partial matches
    incsearch = true,
    -- automatically switch search to case-sensitive when search 
    -- query contains an uppercase letter.
    smartcase = true,

    -- text rendering options
    -- display lines as one long line
    wrap = true,
    -- the encoding written to a file
    fileencoding = "utf-8",
    -- avoid wrapping a line in the middle of a word.
    linebreak = true,
    -- the number of screen lines to keep above and below the cursor
    scrolloff = 8,
    -- the number of screen columns to keep to the left and right of the cursor
    sidescrolloff = 8,

    -- user interface options
    -- allow the mouse to be used in neovim
    --mouse = "a",
    -- set the window’s title, reflecting the file currently being edited
    title = true,
    -- highlight the current line
    cursorline = true,
    -- highlight the cursor line vertically
    --cursorcolumn = true,
    -- set numbered lines
    number = true,

    -- creates a backup file
    --backup = false,              
    -- allows neovim to access the system clipboard
    clipboard = "unnamedplus",
    -- more space in the neovim command line for displaying messages
    cmdheight = 1,
    -- mostly just for cmp
    --completeopt = { "menuone", "noselect" },
    -- so that `` is visible in markdown files
    conceallevel = 0,
    -- pop up menu height
    pumheight = 10,
    showmode = true,                -- we don't need to see things like -- INSERT -- anymore
    showtabline = 2,                -- always show tabs
    splitbelow = true,              -- force all horizontal splits to go below current window
    splitright = true,              -- force all vertical splits to go to the right of current window
    -- swapfile = false,            -- creates a swapfile
    termguicolors = true,        -- set term gui colors (most terminals support this)
    timeoutlen = 1000,              -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                -- enable persistent undo
    updatetime = 300,               -- faster completion (4000ms default)
    -- writebackup = false,            -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    relativenumber = false,         -- set relative numbered lines
    numberwidth = 4,                -- set number column width to 2 {default 4}
    signcolumn = "yes",             -- always show the sign column, otherwise it would shift the text each time
    guifont = "monospace:h17",       -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

--vim.g['rustfmt_autosave'] = 1

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
