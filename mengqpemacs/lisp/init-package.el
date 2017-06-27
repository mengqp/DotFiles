
(require 'package)

;; Set it to `t' to use safer HTTPS to download packages
(defvar melpa-use-https-repo nil
  "By default, HTTP is used to download packages.
But you may use safer HTTPS instead.")

;; (defvar mengqp/packages
;;   '(
;;     undo-tree
;;     general
;;     color-theme
;;     color-theme-solarized
;;     which-key
;;     helm
;;     helm-ag
;;     helm-cscope
;;     helm-make
;;     projectile
;;     helm-projectile
;;     org-projectile
;;     evil
;;     evil-numbers
;;     evil-leader
;;     evil-visualstar
;;     evil-search-highlight-persist
;;     evil-matchit
;;     evil-org
;;     evil-escape
;;     evil-nerd-commenter
;;     xcscope
;;     company
;;     flycheck
;;     flycheck-pos-tip
;;     google-c-style
;;     smex
;;     window-numbering
;;     ace-jump-mode
;;     ace-jump-helm-line
;;     smartparens
;;     flymake
;;     hungry-delete
;;     popwin
;;     powerline
;;     yasnippet
;;     ycmd
;;     company-ycmd
;;     flycheck-ycmd
;;     magit
;;     evil-magit
;;     git-gutter
;;     realgud
;;     ))

(setq package-archives '(
			 ;; ("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
                         ;;  ("org-cn"   . "https://elpa.zilongshanren.com/org/")
                         ;;  ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")
                          ("melpa" . "https://melpa.org/packages/")
                          ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
                          ))



;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;------------------------------------------------------------------------------
;; Fire up package.el and ensure the following packages are installed.
;;------------------------------------------------------------------------------
(package-initialize)

(require-package 'use-package)
(require-package 'general)

(require-package 'color-theme)
(require-package 'color-theme-solarized)
(require-package 'linum-relative)

(require-package 'which-key)

(require-package 'helm)
(require-package 'helm-ag)
(require-package 'helm-cscope)
(require-package 'helm-make)
(require-package 'helm-projectile)

(require-package 'popup)


(require-package 'projectile)
(require-package 'org-projectile)

(require-package 'evil)
(require-package 'evil-numbers)
(require-package 'evil-leader)
(require-package 'evil-visualstar)
(require-package 'evil-search-highlight-persist)
(require-package 'evil-matchit)
(require-package 'evil-org)
(require-package 'evil-escape)
(require-package 'evil-nerd-commenter)

(require-package 'xcscope)
(require-package 'company)

(require-package 'google-c-style)
(require-package 'smex)

(require-package 'window-numbering)

(require-package 'ace-jump-mode)
(require-package 'ace-jump-helm-line)


(require-package 'smartparens)
(require-package 'flymake)
(require-package 'hungry-delete)
(require-package 'popwin)
(require-package 'powerline)
(require-package 'spaceline)
(require-package 'diminish)



(require-package 'yasnippet)

(require-package 'ycmd)
(require-package 'company-ycmd)
(require-package 'flycheck-ycmd)


(require-package 'magit)
(require-package 'evil-magit)
(require-package 'git-gutter)

(require-package 'realgud)
(require-package 'flycheck-package)
(require-package 'package-lint)
(require-package 'helm-c-yasnippet)



;; (defun mengqp/packages-install ()
;;   (cl-loop for pkg in mengqp/packages
;;            when (not (package-installed-p pkg))
;;            do (return nil)
;;            finally (return t)
;;            ))

;; (unless (mengqp/packages-install)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg mengqp/packages)
;;     (when (not (mengqp/package-install pkg))
;;       (require-package pkg))))




(provide 'init-package)

;;; init-package ends here
