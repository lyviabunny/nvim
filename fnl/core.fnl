(import-macros {: let!} :laurel.macros)

(let! :o :wrap true)

(let! :o :termguicolors true)

(let! :o :number true)
(let! :o :relativenumber true)

(let! :o :swapfile false)

(let! :o :undofile true)
(let! :o :undolevels 500)
(let! :o :undoreload 5000)
(let! :o :undodir (vim.fn.expand "~/.local/share/nvim/undo"))

(let! :o :tabstop 2)
(let! :o :shiftwidth 2)
(let! :o :softtabstop 2)
(let! :o :expandtab true)
(let! :o :shiftround true)

(let! :o :cursorline true)
(let! :o :guicursor "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor")

(let! :o :signcolumn "yes")
(let! :o :colorcolumn "80")

(let! :o :clipboard "unnamedplus")

(let! :o :ignorecase true)
(let! :o :incsearch true)
(let! :o :completeopt "menu,menuone,noselect")
(let! :o :wildmode "longest:full,full")

(let! :o :scrolloff 10)

(let! :o :conceallevel 2)

(let! :o :winborder "rounded")

(let! :o :mouse "")

(let! :g :autoformat true)

(let! :g :mapleader " ")
