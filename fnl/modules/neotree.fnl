(import-macros {: map! : use-package! : sync-packages!} :macros)

(use-package! "https://github.com/nvim-neo-tree/neo-tree.nvim")
(sync-packages!)

(let [{: setup} (require :neo-tree)]
  (setup {:use_popups_for_input true
          :popup_border_style :solid
          :window {:position :left :width 25}
          :filesystem {:use_libuv_file_watcher true}
          :default_component_configs {:indent {:with_markers false}
                                      :git_status {:symbols {:deleted "-"
                                                             :renamed "*"
                                                             :untracked ""
                                                             :ignored ""
                                                             :unstaged ""
                                                             :staged ""
                                                             :conflict ""}}}}))

(map! [n] :<leader>e ":Neotree toggle<CR>"
      { :silent true })
