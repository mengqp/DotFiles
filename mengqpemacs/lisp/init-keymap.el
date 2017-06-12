(require 'general)
(general-evil-setup t)
;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
;; 全局
(nvmap :prefix "SPC"
        "1" 'select-window-1
        "2" 'select-window-2
        "3" 'select-window-3
        "4" 'select-window-4
        "5" 'select-window-5
        "6" 'select-window-6
        "7" 'select-window-7
        "8" 'select-window-8
        "9" 'select-window-9

        "bb" 'helm-buffers-list
        "bd" 'kill-buffer

        "ff" 'helm-find-files  ;;
        "fr" 'helm-recentf  ;;

        "gs" 'magit-status


        "pf" 'find-file-in-project
        "pd" 'find-directory-in-project-by-selected

        "ws" 'split-window-vertically
        "wv" 'split-window-horizontally

        "x0" 'delete-window
        "x1" 'delete-other-windows

        "/" 'helm-do-ag-project-root
       )

;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
;; 本文件
(nvmap :prefix ","
       ","  'evilnc-comment-or-uncomment-lines
       ;;"aa" 'copy-to-x-clipboard ; used frequently
       "eb" 'eval-buffer
       "ee" 'eval-expression
       "fb" 'beginning-of-defun
       "fe" 'end-of-defun

       "gg" 'ycmd-goto
       "gs" 'helm-cscope-find-this-symbol
       "gd" 'helm-cscope-find-global-definition
       "gc" 'helm-cscope-find-called-function
       "gC" 'helm-cscope-find-calling-this-function
       "gi" 'cscope-index-files

       "hk" 'describe-key
       "hv" 'describe-variable

       "jj" 'ace-jump-char-mode
       "jc" 'ace-jump-char-mode
       "jw" 'ace-jump-word-mode
       "jl" 'ace-jump-line-mode

       "mk" 'bookmark-set
       "mm" 'counsel-bookmark-goto

       "sc" 'shell-command
       "sd" 'sudo-edit
       "sj" 'mengqp/helm-jump-in-buffer
       "ss" 'mengqp/helm-file-smart-do-search

       ;;"zz" 'paste-from-x-clipboard ; used frequently
       )

;; {{ Use `SPC` as leader key
;; all keywords arguments are still supported
;; 本文件
(nvmap :prefix ";"
       ";"  'evilnc-comment-or-uncomment-lines
       )


(provide 'init-keymap)
