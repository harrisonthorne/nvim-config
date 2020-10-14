local map = vim.api.nvim_set_keymap

map('', "<bslash>", "<Plug>(easymotion-prefix)", {})

-- get highlight under cursor
-- map <F10> :echo "hi<" . synIDattr(synID(line(".", {}),col(".", {}),1),"name", {}) . '> trans<'
--             \ . synIDattr(synID(line(".", {}),col(".", {}),0),"name", {}) . "> lo<"
--             \ . synIDattr(synIDtrans(synID(line(".", {}),col(".", {}),1)),"name", {}) . ">"<CR>

-- navigate long lines easily
map('n', "j", "gj", { noremap = true, silent = true })
map('n', "k", "gk", { noremap = true, silent = true })

-- map('i', "<expr> <C-n>", "coc#refresh()", { noremap = true, silent = true})
-- FZF/skim

map('', "<C-p>", ":Files<CR>", {})

-- todo list
map('n', "<leader>to", ":Ag (note)|(xxx)|(fixme)|(todo)<cr>", { noremap = true })

-- easily edit init.vim file
map('', "<leader>rc", ":tabe ~/.config/nvim/init.vim<CR>", {})

-- easy window resizing in normal mode
map('n', "+", ":5wincmd ><CR>", { noremap = true, silent = true})
map('n', "-", ":5wincmd <<CR>", { noremap = true, silent = true})
map('n', "^", ":3wincmd +<CR>", { noremap = true, silent = true})
map('n', "_", ":3wincmd -<CR>", { noremap = true, silent = true})

-- toggle wrap
map('', "<leader>w :set", "wrap!<CR>", { noremap = true })

-- easy window moving and switching
map('', "<leader>H", ":wincmd H<CR>", { noremap = true, silent = true})
map('', "<leader>J", ":wincmd J<CR>", { noremap = true, silent = true})
map('', "<leader>K", ":wincmd K<CR>", { noremap = true, silent = true})
map('', "<leader>L", ":wincmd L<CR>", { noremap = true, silent = true})
map('', "<leader>h", ":wincmd h<CR>", { noremap = true, silent = true})
map('', "<leader>j", ":wincmd j<CR>", { noremap = true, silent = true})
map('', "<leader>k", ":wincmd k<CR>", { noremap = true, silent = true})
map('', "<leader>l", ":wincmd l<CR>", { noremap = true, silent = true})
map('', "<leader>=", ":wincmd =<CR>", { noremap = true, silent = true})
map('', "<leader>W", ":windo set nowinfixwidth nowinfixheight<CR>", { noremap = true, silent = true})

-- trim whitespace
map('', "<leader>tw", ":%s/\\s\\+$//e<CR>:noh<CR>", { noremap = true, silent = true})

-- tab shortcuts
map('', "<leader>tc", ":tabc<CR>", { noremap = true })
map('', "<leader>te", ":tabe<CR>", { noremap = true })

-- splitting shortcuts
map('', "<leader>nv", ":vs<CR>", { noremap = true })
map('', "<leader>ns", ":sp<CR>", { noremap = true })
map('', "<leader>v", ":vs<CR>:FZF<CR>", { noremap = true })
map('', "<leader>s", ":sp<CR>:FZF<CR>", { noremap = true })
map('', "<leader>t", ":tabe<CR>:FZF<CR>", { noremap = true })

-- Fugitive shortcuts
map('', "<leader>gg", ":Git", { noremap = true })
map('', "<leader>gs", ":Gstatus<CR>", { noremap = true })

-- Golang shortcuts
map('n', "<leader>gof", ":!gofmt -s -w \"%\"<CR>", { noremap = true, silent = true})
map('n', "<leader>gob", ":!go build<CR>", { noremap = true })
map('n', "<leader>goi", ":!go install<CR>", { noremap = true })
map('n', "<leader>gor", ":!go run *.go", { noremap = true })

-- Lanuage Server shortcuts
map('n', "<leader>ca", ":CocAction<CR>", { noremap = true, silent = true})
map('n', "<leader>cc", ":CocCommand<space>", { noremap = true, silent = true})
map('n', "<leader>cr", "<Plug>(coc-rename)", { silent = true })
map('n', "<leader>cx", "<Plug>(coc-references)", { silent = true })
map('n', "<leader>ct", "<Plug>(coc-type-definition)", { silent = true })
map('n', "<leader>cf", "<Plug>(coc-format)", { silent = true })
map('n', "<leader>cq", "<Plug>(coc-fix-current)", { silent = true })
map('n', "<leader>ci", "<Plug>(coc-diagnostic-info)", { silent = true })
map('n', "<leader>cn", "<Plug>(coc-diagnostic-next)", { silent = true })
map('n', "<leader>cp", "<Plug>(coc-diagnostic-prev)", { silent = true })
map('n', "<leader>/", "<Plug>(coc-definition)", { silent = true })
map('n', "<leader>?", ":call CocAction('doHover')<CR>", { noremap = true, silent = true})
map('n', "K", ":call CocAction('doHover')<CR>", { noremap = true, silent = true})

map('n', "<leader>xt", ":tabe<CR>:terminal<CR>i", { noremap = true, silent = true})
map('n', "<leader>xv", ":vs<CR>:terminal<CR>i", { noremap = true, silent = true})
map('n', "<leader>xx", ":terminal<CR>i", { noremap = true, silent = true})
map('n', "<leader>xs", ":sp<CR>:terminal<CR>i", { noremap = true, silent = true})

-- Misc shortcuts
map('', "<leader>e", ":Lex<CR>", { noremap = true, silent = true})
map('', "<leader>q", ":q<CR>", { noremap = true, silent = true})
map('', "<leader>pwd", ":pwd<CR>", { noremap = true, silent = true})
map('', "<leader>pp", ":!pandoc --filter pandoc-citeproc \"%\" -o \"%.pdf\"<CR>", { noremap = true, silent = true})
map('', "<leader>pd", ":!pandoc --filter pandoc-citeproc \"%\" -o \"%.docx\"<CR>", { noremap = true, silent = true})
map('', "<leader>pm", ":!pandoc --filter pandoc-citeproc \"%\" -o \"%.md\"<CR>", { noremap = true, silent = true})
map('', "<leader>ph", ":!pandoc --filter pandoc-citeproc \"%\" -o \"%.html\"<CR>", { noremap = true, silent = true})
map('', "<leader>cd", ":cd %:p:h<CR>:pwd<CR>", { noremap = true, silent = true})
map('n', "Y", "y$", { noremap = true })

-- diff shortcuts
map('n', "<leader>dp", ":diffput<CR>", { noremap = true })
map('n', "<leader>dg", ":diffget<CR>", { noremap = true })
map('n', "<leader>dt", ":diffthis<CR>", { noremap = true })
map('n', "<leader>do", ":diffoff<CR>:set noscrollbind<CR>:set nocursorbind<CR>", { noremap = true })

-- easy lnext, cnext, etc
map('n', "<leader>zn", ":lnext<CR>", { noremap = true })
map('n', "<leader>zp", ":lprev<CR>", { noremap = true })
map('n', "<leader>zN", ":lnfile<CR>", { noremap = true })
map('n', "<leader>zP", ":lpfile<CR>", { noremap = true })
map('n', "<leader>xn", ":cnext<CR>", { noremap = true })
map('n', "<leader>xp", ":cprev<CR>", { noremap = true })
map('n', "<leader>xN", ":cnfile<CR>", { noremap = true })
map('n', "<leader>xP", ":cpfile<CR>", { noremap = true })

-- buffer shortcuts
map('n', "<leader>b", ":ls<CR>:b<space>", { noremap = true })

-- jump to floating window
map('n', "<leader>f", "<plug>(coc-float-jump)", {})

map('i', "jj", "<esc>", { noremap = true })
map('i', "fj", "<esc>", { noremap = true })
map('n', "!", ":!", { noremap = true })
