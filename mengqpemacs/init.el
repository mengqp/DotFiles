;;; mengqp emacs confing

(defvar best-gc-cons-threshold 4000000 "Best default gc threshold value. Should't be too big.")
;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

;; *Message* buffer should be writable in 24.4+
(defadvice switch-to-buffer (after switch-to-buffer-after-hack activate)
  (if (string= "*Messages*" (buffer-name))
      (read-only-mode -1)))


(package-initialize)

;; @see https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
;; Normally file-name-handler-alist is set to
;; (("\\`/[^/]*\\'" . tramp-completion-file-name-handler)
;; ("\\`/[^/|:][^/|]*:" . tramp-file-name-handler)
;; ("\\`/:" . file-name-non-special))
;; Which means on every .el and .elc file loaded during start up, it has to runs those regexps against the filename.
(let ((file-name-handler-alist nil))
;;; package here
(require 'init-package)

(require 'init-modeline)
(require 'init-color-theme)
(require 'init-base)
(require 'init-which-key)

(require 'init-cscope)
(require 'init-ycmd)
(require 'init-company)
(require 'init-smex)
(require 'init-org)
(require 'init-yasnippet)
(require 'init-smartparens)
(require 'init-window-numbering)
(require 'init-flymake)
(require 'init-helm)

;; (require 'init-theme)
;; (require 'init-neotree)
;; (require 'init-swiper)
; (require 'init-counsel)
(require 'init-hungry-delete)
(require 'init-powerline)
(require 'init-popwin)
(require 'init-ace-jump)
(require 'init-projectile)
;; (require 'init-keysbind)
(require 'unicad)
(require 'init-git)
(require 'init-evil)

(require 'init-func)
(require 'init-keymap)

)

;; (server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "  ")
 '(package-selected-packages
   (quote
    (evil-escape evil-org evil-visualstar evil-search-highlight-persist evil-numbers evil-matchit evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
