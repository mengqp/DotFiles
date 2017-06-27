(require 'color-theme)

(use-package color-theme
  :init
  (require 'color-theme-solarized)
  (load-theme 'solarized t)
  (set-frame-parameter nil 'background-mode 'dark)    ;;选择solarized dark
  (enable-theme 'solarized)
    )

(provide 'init-color-theme)
