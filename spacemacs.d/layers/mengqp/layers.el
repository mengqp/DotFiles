
(configuration-layer/declare-layers '(
                                      helm
                                      ivy
                                      better-defaults
                                      colors
                                      (org :variables
                                           org-projectile-file "readme.org")
                                      markdown
                                      (git :variables
                                           git-magit-status-fullscreen t)
                                      (shell :variables shell-default-shell 'eshell)
                                      ycmd
                                      cscope
                                      (auto-completion :variables
                                                       auto-completion-private-snippets-directory "~/.spacemacs.d/snippets"
                                                       auto-completion-enable-snippets-in-popup t
                                                       auto-completion-enable-sort-by-usage t)
                                      syntax-checking
                                      (c-c++ :variables
                                             c-c++-default-mode-for-headers 'c++-mode)
                                      ;; 自已在网上找的
                                      unicad
                                      mengqp-google-c-style
                                      ;;mengqp-chinese-pyim
                                      ;;google-c-style

                                      ))

(configuration-layer/remove-layers '(



                                     )




 )
