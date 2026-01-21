(import-macros {: map! : use-package! : sync-packages!} :macros)

(use-package! "https://github.com/nvim-lua/plenary.nvim")
(use-package! "https://github.com/BurntSushi/ripgrep")
(use-package! "https://github.com/nvim-telescope/telescope.nvim")
(use-package! "https://github.com/nvim-telescope/telescope-fzf-native.nvim")
(use-package! "https://github.com/nvim-telescope/telescope-ui-select.nvim")
(use-package! "https://github.com/nvim-telescope/telescope-file-browser.nvim")
(use-package! "https://github.com/nvim-telescope/telescope-project.nvim")
(use-package! "https://github.com/nvim-telescope/telescope-media-files.nvim")
(sync-packages!)

(local {: load_extension
        : setup}
       (require :telescope))

(setup {:defaults {:prompt_prefix "   "
                   :selection_caret "  "
                   :entry_prefix "  "
                   :sorting_strategy :ascending
                   :layout_strategy :flex
                   :set_env {:COLORTERM :truecolor}
                   :dynamic_preview_title
                   :layout_config {:horizontal {:prompt_position :top
                                                :preview_width 0.55}
                                   :vertical {:mirror false}
                                   :width 0.87
                                   :height 0.8
                                   :preview_cutoff 120} true}
       :pickers {:oldfiles {:prompt_title "Recent files"}}})

(load_extension :ui-select)
(load_extension :file_browser)
(load_extension :project)

(fn executable? [...]
  "checks whether some executable is present in the system"
  (= 1 (vim.fn.executable ...)))

(when (executable? :ueberzug)
  (load_extension :media_files))

(local {:lsp_implementations open-impl-float!
        :lsp_references open-ref-float!
        :lsp_document_symbols open-local-symbol-float!
        :lsp_workspace_symbols open-workspace-symbol-float!
        :find_files find-files-float!}
       (require :telescope.builtin))

(map! [n] :<leader>li open-impl-float!
     {:desc "(lsp) find implementations"})
(map! [n] :<leader>lr open-ref-float!
     {:desc "(lsp) jump to reference"})
(map! [n] :<leader>lsf open-local-symbol-float!
     {:desc "(lsp) jump to symbol in file"})
(map! [n] :<leader>lsp open-workspace-symbol-float!
     {:desc "(lsp) symbols in project"})

(map! [n] :<leader>ff find-files-float!
     {:desc "find files"})
