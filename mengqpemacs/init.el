;;; mengqp emacs confing

(defvar best-gc-cons-threshold 4000000 "Best default gc threshold value. Should't be too big.")
;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

 ;; Function to collect information of packages.
(defvar missing-packages-list nil
  "List of packages that `try-require' can't find.")

(defvar package-init-statistic nil "Package loading statistics")

;; attempt to load a feature/library, failing silently
(defun try-require (feature &optional click)
  "Attempt to load a library or module. Return true if the
library given as argument is successfully loaded. If not, instead
of an error, just add the package to a list of missing packages."
  (condition-case err
      ;; protected form
      (let ((timestamp (current-time))
            (package (if (stringp feature) feature (symbol-name feature))))
        (if (stringp feature)
            (load-library feature)
          (require feature))
        (if click
            (add-to-list 'package-init-statistic
                         (cons (if (stringp feature) feature (symbol-name feature))
                               (float-time (time-since timestamp)))))
        (message "Checking for library `%s'... Found, cost %.2f seconds"
                 feature (float-time (time-since timestamp))))
    ;; error handler
    (file-error  ; condition
     (progn
       (message "Checking for library `%s'... Missing" feature)
       (add-to-list 'missing-packages-list feature 'append))
     nil)))

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

;; (try-require 'init-package)
;; (try-require 'init-autoload)
;; (try-require 'init-color-theme)
;; (try-require 'init-base)
;; (try-require 'init-company)
;;; package here
(require 'init-package)
(require 'init-autoload)

(require 'init-color-theme)
(require 'init-base)
(require 'init-hungry-delete)
(require 'init-smartparens)

(require 'init-company)
(require 'init-smex)
(require 'init-org)
(require 'init-window-numbering)
(require 'init-helm)

(require 'init-popwin)
(require 'init-projectile)
(require 'init-evil)
(require 'init-cc-mode)
(require 'init-yasnippet)
(require 'init-ycmd)
(require 'init-flycheck)
(require 'init-ace-jump)


(require 'init-modeline)
(require 'init-func)
(require 'init-keymap)

(require 'init-idle-require)
(setq idle-require-idle-delay 1)
(setq idle-require-symbols '(
			     init-which-key
			     init-git
			     ))
(idle-require-mode 1) ;; starts loading


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
    (flycheck-pos-tip evil-escape evil-org evil-visualstar evil-search-highlight-persist evil-numbers evil-matchit evil-leader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
