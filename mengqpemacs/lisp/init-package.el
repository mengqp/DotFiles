
(require 'package)

;; Set it to `t' to use safer HTTPS to download packages
(defvar melpa-use-https-repo nil
  "By default, HTTP is used to download packages.
But you may use safer HTTPS instead.")

;; List of VISIBLE packages from melpa-unstable (http://melpa.org)
;; Feel free to add more packages!
;; (defvar melpa-include-packages
;;   '(ace-mc
;;     bbdb
;;     color-theme
;;     js-doc
;;     ;; {{ since stable v0.9.1 released, we go back to stable version
;;     ;; ivy
;;     ;; counsel
;;     ;; swiper ; abo-abo has not released 9.0 yet, at least he didn't tag master branch
;;     ;; }}
;;     wgrep
;;     robe
;;     groovy-mode
;;     inf-ruby
;;     company ; I won't wait another 2 years for stable
;;     simple-httpd
;;     dsvn
;;     move-text
;;     string-edit ; looks magnars don't update stable tag frequently
;;     findr
;;     mwe-log-commands
;;     yaml-mode
;;     noflet
;;     db
;;     creole
;;     web
;;     idomenu
;;     buffer-move
;;     regex-tool
;;     quack
;;     legalese
;;     htmlize
;;     scratch
;;     session
;;     crontab-mode
;;     bookmark+
;;     flymake-lua
;;     multi-term
;;     dired+
;;     inflections
;;     dropdown-list
;;     lua-mode
;;     tidy
;;     pomodoro
;;     auto-compile
;;     packed
;;     gitconfig-mode
;;     textile-mode
;;     w3m
;;     erlang
;;     workgroups2
;;     company-c-headers)
;;   "Don't install any Melpa packages except these packages")
;; (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
;;                          ("marmalade" . "http://marmalade-repo.org/packages/")
;;                          ("melpa1" . "http://melpa.org/packages/")
;;                          ( "elpa-popkit" . "http://elpa.popkit.org/packages")))

(setq package-archives '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
                          ("org-cn"   . "https://elpa.zilongshanren.com/org/")
                          ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")
                          ("melpa" . "https://melpa.org/packages/")
                          ("melpa-stable" . "https://stable.melpa.org/packages/")
                          ))

;; ;;------------------------------------------------------------------------------
;; ;; Internal implementation, newbies should NOT touch code below this line!
;; ;;------------------------------------------------------------------------------

;; ;; Patch up annoying package.el quirks
;; (defadvice package-generate-autoloads (after close-autoloads (name pkg-dir) activate)
;;   "Stop package.el from leaving open autoload files lying around."
;;   (let* ((path (expand-file-name (concat
;;                                   ;; name is string when emacs <= 24.3.1,
;;                                   (if (symbolp name) (symbol-name name) name)
;;                                   "-autoloads.el") pkg-dir)))
;;     (with-current-buffer (find-file-existing path)
;;       (kill-buffer nil))))

;; (defun package-filter-function (package version archive)
;;   "Optional predicate function used to internally filter packages used by package.el.

;;   The function is called with the arguments PACKAGE VERSION ARCHIVE, where
;;   PACKAGE is a symbol, VERSION is a vector as produced by `version-to-list', and
;;   ARCHIVE is the string name of the package archive."
;;   (let* (rlt)
;;     (cond
;;      ((string= archive "melpa-stable")
;;       (setq rlt t)
;;       ;; don's install `request v0.0.3' which drop suppport of Emacs 24.3
;;       (if (string= package "request") (setq rlt nil)))
;;      ((string= archive "melpa")
;;       (cond
;;        ;; a few exceptions from unstable melpa
;;        ((or (memq package melpa-include-packages)
;;             ;; install all color themes
;;             (string-match (format "%s" package) "-theme"))
;;         (setq rlt t))
;;        (t
;;         ;; I don't trust melpa which is too unstable
;;         (setq rlt nil))))
;;      (t
;;       ;; other third party repositories I trust
;;       (setq rlt t)))
;;     rlt))

;; (defadvice package--add-to-archive-contents
;;     (around filter-packages (package archive) activate)
;;   "Add filtering of available packages using `package-filter-function'."
;;   (if (package-filter-function (car package)
;;                                (funcall (if (fboundp 'package-desc-version)
;;                                             'package--ac-desc-version
;;                                           'package-desc-vers)
;;                                         (cdr package))
;;                                archive)
;;       ad-do-it))


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


(require-package 'general)

(require-package 'color-theme)
(require-package 'color-theme-solarized)

(require-package 'which-key)

(require-package 'helm)
(require-package 'helm-ag)
(require-package 'helm-cscope)



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

(require-package 'smex)

(require-package 'window-numbering)

(require-package 'ace-jump-mode)
(require-package 'ace-jump-helm-line)


(require-package 'smartparens)
(require-package 'flymake)
(require-package 'hungry-delete)
(require-package 'popwin)
(require-package 'powerline)


(require-package 'yasnippet)

(require-package 'ycmd)
(require-package 'company-ycmd)
(require-package 'flycheck-ycmd)


(require-package 'magit)
(require-package 'evil-magit)
(require-package 'git-gutter)




(provide 'init-package)
