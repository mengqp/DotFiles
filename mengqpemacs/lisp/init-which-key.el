(require 'which-key)
(which-key-mode)

(which-key-setup-side-window-bottom)
(which-key-setup-minibuffer)

;; Set the prefix string that will be inserted in front of prefix commands
;; (i.e., commands that represent a sub-map).
(setq which-key-prefix-prefix "+" )

(which-key-add-key-based-replacements
  "SPC b" "buffers")

(which-key-add-key-based-replacements
  "SPC f" "files")



(provide 'init-which-key)
