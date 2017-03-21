
;; 去除一个警告
(setq exec-path-from-shell-check-startup-files nil)

;; 清楚白块
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 输入法切换时不出现问题
(global-set-key (kbd "C-SPC") nil)

;; 设置字体
(setq-default dotspacemacs-default-font '("Source Code Pro Regular"
                                          :size 15
                                          :weight normal
                                          :width normal
                                          :powerline-scale 1.1))

;; 设置相对行数 我的电脑有点卡
(setq-default dotspacemacs-line-numbers 'relative)

; 去除 M-x 里面的 ^
(setq ivy-initial-inputs-alist nil)

;; 设置company
(add-hook 'after-init-hook 'global-company-mode)

;; ycmd
(set-variable 'ycmd-server-command '("python" "/home/mengqp/DotFiles/ycmd/ycmd"))
(set-variable 'ycmd-global-config "~/DotFiles/ycmd/cpp/ycm/.ycm_extra_conf.py")
(setq ycmd-extra-conf-handler (quote load))
(add-hook 'c-mode-hook 'ycmd-mode)
(add-hook 'c++-mode-hook 'ycmd-mode)
;; (add-hook 'after-init-hook 'global-ycmd-mode)
(add-hook 'after-init-hook 'yas-global-mode)

 ;; custom
(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)

;; 设置todo
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "BUG(b@/!)"  "|"  "BUGFIXD(B@/!)"  )
              (sequence "FEATURE(f@/!)" "|"  "FEATUREFINISH(F@/!)" )
              (sequence "RELEASE(r@/!)" "|" "CANCELLED(c@/!)")
              (sequence "ISSUE(i@/!)" "|" "ISSUECLOSE(I@/!)")
              )))

;; 设置jk也是escape
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

;; 设置了这一句可以编org-present 不知道什么原因
(setq package-check-signature nil)

;; (defalias 'display-buffer-in-major-side-window 'window--make-major-side-window)
