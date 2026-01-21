(import-macros {: let! : autocmd!} :laurel.macros)
(import-macros {: use-package! : sync-packages!} :macros)

(use-package! "https://github.com/nvim-treesitter/nvim-treesitter")
(sync-packages!)

(local treesitter-filetypes [:lua
                             :fennel
                             :vimdoc
                             :vim
                             :regex
                             :query
                             :latex
                             :nix
                             :python
                             :bash
                             :c
                             :cpp
                             :rust
                             :toml
                             :markdown
                             :markdown_inline
                             :git_rebase
                             :gitattributes
                             :gitcommit
                             :svelte
                             :vento
                             :typescript
                             :tsx
                             :javascript
                             :jsx
                             :html
                             :css])

(fn setup_treesitter []
  (vim.treesitter.start)
  (let! :bo :indentexpr "v:lua.require'nvim-treesitter'.indentexpr()"))

(each [_ lang (ipairs treesitter-filetypes)]
  (autocmd! :FileType
	    {:pattern lang
	     :callback setup_treesitter}))
