local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo

g.mapleader = ','

g.completion_auto_change_source = 1
g.completion_confirm_key = '<C-y>'
g.completion_enable_snippet = 'vim-vsnip'
g.completion_matching_ignore_case = 0
g.diagnostic_auto_popup_while_jump = 1
g.diagnostic_enable_virtual_text = 1
g.diagnostic_insert_delay = 1
g.gitgutter_map_keys = 0
g.gitgutter_sign_allow_clobber = 0
g.table_mode_corner = '+'
g.table_mode_corner_corner = '+'
g.table_mode_header_fillchar = '='
g.pandoc_preview_pdf_cmd = "zathura"
g.space_before_virtual_text = 2
g.startify_session_persistence = 1
g.tex_conceal = ""

o.autowriteall = true
o.autoread = true
o.background = "dark"
o.breakindent = true -- Indents word-wrapped lines as much as the line above
o.clipboard = "unnamedplus"
o.cmdheight = 2
o.complete = ".,w,b,u,t,kspell" -- spell check
o.completeopt = "menuone,noinsert,noselect"
o.conceallevel = 1
o.diffopt = "hiddenoff"
o.equalalways = true
o.fillchars = "vert:|,fold:~,stl:-,stlnc:-"
o.expandtab = true
o.formatoptions = "lt" -- Ensures word-wrap does not split words
o.hidden = true
o.ignorecase = true
o.lazyredraw = true
o.lbr = true
o.list = true
o.listchars = "tab:> ,trail:·"
o.mouse = "a"
o.backup = false
o.writebackup = false
o.cursorline = true
o.showmode = false -- hides -- INSERT --
o.eb = false -- no error bells
o.wb = false
o.vb = false
o.shiftwidth = 4
o.shortmess = "caFTW"
o.si = true  -- Smart indent
o.smartcase = true
o.softtabstop = 4
o.scrolloff = 5
o.splitbelow = true
o.splitright = true
o.tabstop = 4 -- Tab size is 4
o.textwidth = 80
o.tags = "./tags;"
o.termguicolors = false
o.updatetime = 300
o.whichwrap = "<,>,h,l"
o.wildignore = "*/node_modules,*/node_modules/*,.git,.git/*,tags,*/dist,*/dist/*"
o.wrap = true

wo.number = true
wo.relativenumber = true
wo.signcolumn = "yes:1"
