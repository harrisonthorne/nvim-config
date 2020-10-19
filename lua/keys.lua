local map = vim.api.nvim_set_keymap

map('', "<bslash>", "<Plug>(easymotion-prefix)", {})

-- get highlight under cursor
-- map <F10> :echo "hi<" . synIDattr(synID(line(".", {}),col(".", {}),1),"name", {}) . '> trans<'
--             \ . synIDattr(synID(line(".", {}),col(".", {}),0),"name", {}) . "> lo<"
--             \ . synIDattr(synIDtrans(synID(line(".", {}),col(".", {}),1)),"name", {}) . ">"<CR>

-- navigate long lines easily
map('n', "j", "gj", { noremap = true, silent = true })
map('n', "k", "gk", { noremap = true, silent = true })

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

-- splitting shortcuts
map('n', "<leader>vn", ":vert new<CR>", { noremap = true })
map('n', "<leader>sn", ":new<CR>", { noremap = true })
map('n', "<leader>tn", ":tabnew<CR>", { noremap = true })
map('n', "<leader>vv", ":vs<CR>:Files<CR>", { noremap = true })
map('n', "<leader>ss", ":sp<CR>:Files<CR>", { noremap = true })
map('n', "<leader>tt", ":tabnew<CR>:Files<CR>", { noremap = true })

-- Fugitive shortcuts
map('', "<leader>gg", ":Git", { noremap = true })
map('', "<leader>gs", ":Gstatus<CR>", { noremap = true })

-- Golang shortcuts
map('n', "<leader>gof", ":!gofmt -s -w \"%\"<CR>", { noremap = true, silent = true})
map('n', "<leader>gob", ":!go build<CR>", { noremap = true })
map('n', "<leader>goi", ":!go install<CR>", { noremap = true })
map('n', "<leader>gor", ":!go run *.go", { noremap = true })

-- Lanuage Server shortcuts
map('i', "<c-n>", "<cmd>lua vim.lsp.buf.completion()<cr>", { noremap = true, silent = true})
map('n', "<leader>xa", "<cmd>lua vim.lsp.buf.code_action()<cr>", { noremap = true, silent = true})
map('n', "<leader>xr", "<cmd>lua vim.lsp.buf.rename()<cr>", { silent = true })
map('n', "<leader>xe", "<cmd>lua vim.lsp.buf.references()<cr>", { silent = true })
map('n', "<leader>xd", "<cmd>lua vim.lsp.buf.declaration()<cr>", { silent = true })
map('n', "<leader>xf", "<cmd>lua vim.lsp.buf.formatting()<cr>", { silent = true })
map('n', "<leader>xi", "<cmd>OpenDiagnostic<cr>", { silent = true })
map('n', "<leader>xn", "<cmd>NextDiagnosticCycle<cr>", { silent = true })
map('n', "<leader>xp", "<cmd>PrevDiagnosticCycle<cr>", { silent = true })
map('n', "<leader>/", "<cmd>lua vim.lsp.buf.definition()<cr>", { silent = true })
map('n', "<leader>?", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true})
map('n', "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { noremap = true, silent = true})

map('i', "<c-h>", "<plug>(completion_prev_source)", {}) -- use <c-k> to switch to next completion
map('i', "<c-l>", "<plug>(completion_next_source)", {}) -- use <c-j> to switch to previous completion

-- Completion/snippets
map('i', "<c-j>", "vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<c-j>'", { expr = true }) 
map('i', "<c-k>", "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<c-k>'", { expr = true }) 
map('i', "<c-;>", "vsnip#available(1) ? '<plug>(vsnip-expand-or-jump)' : '<c-;>'", { expr = true })

-- Terminal shortcuts
map('n', "<leader>tx", ":tabnew<CR>:terminal<CR>i", { noremap = true, silent = true})
map('n', "<leader>vx", ":vs<CR>:terminal<CR>i", { noremap = true, silent = true})
map('n', "<leader>sx", ":sp<CR>:terminal<CR>i", { noremap = true, silent = true})
map('n', "<leader>xx", ":terminal<CR>i", { noremap = true, silent = true})

-- Misc shortcuts
map('', "<leader>e", ":Lex<CR>", { noremap = true, silent = true})
map('', "<leader>q", ":q<CR>", { noremap = true, silent = true})
map('', "<leader>tq", ":tabc<CR>", { noremap = true })
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
map('n', "<leader>mn", ":lnext<CR>", { noremap = true })
map('n', "<leader>mp", ":lprev<CR>", { noremap = true })
map('n', "<leader>mN", ":lnfile<CR>", { noremap = true })
map('n', "<leader>mP", ":lpfile<CR>", { noremap = true })
map('n', "<leader>cn", ":cnext<CR>", { noremap = true })
map('n', "<leader>cp", ":cprev<CR>", { noremap = true })
map('n', "<leader>cN", ":cnfile<CR>", { noremap = true })
map('n', "<leader>cP", ":cpfile<CR>", { noremap = true })

-- buffer shortcuts
map('n', "<leader>b", ":ls<CR>:b<space>", { noremap = true })

map('i', "jj", "<esc>", { noremap = true })
map('i', "fj", "<esc>", { noremap = true })
map('n', "!", ":!", { noremap = true })
