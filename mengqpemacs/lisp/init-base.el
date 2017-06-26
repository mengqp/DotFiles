;;这就一个进行基本配置的文件
(require 'init-coding)
(require 'unicad)

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
;;显示行列号
;(setq column-number-mode t)
(require 'linum-relative)
;; (linum-mode t)
;; (setq line-number-mode t)
(global-linum-mode t)
(linum-on)
(linum-relative-on)
;; (setq-default dotspacemacs-line-numbers 'relative)

; 去除 M-x 里面的 ^
(setq ivy-initial-inputs-alist nil)

;;启用时间显示设置，在minibuffer上面的那个杠上
;; (display-time-mode 1)
;; (defface egoge-display-time
;;   '((((type x w32 mac))
;;      ;; #060525 is the background colour of my default face.
;;      (:foreground "#060525" :inherit bold))
;;     (((type tty))
;;      (:foreground "blue")))

  ;; "Face used to display the time in the mode line.")

;; This causes the current time in the mode line to be displayed in
;; `egoge-display-time-face' to make it stand out visually.
;; (setq display-time-string-forms
;;       '((propertize (concat " " 24-hours ":" minutes " ")
;;                     'face 'egoge-display-time)))


;; (which-function-mode)
;; (setq-default header-line-format
;;               '((which-func-mode ("" which-func-format " "))))


;;关闭开启画面
(setq inhibit-startup-message t)

;;禁用工具栏
(tool-bar-mode -1)

;;禁用菜单栏
(menu-bar-mode -1)

;;滚轮去掉
(set-scroll-bar-mode -1)

;;终端鼠标支持
(xterm-mouse-mode t)

;;设置UTF8
(set-language-environment "UTF-8")

;;显示括号匹配
(show-paren-mode t)

;;在标题栏提示位置
;; (setq frame-title-format "emacs@%b")

;;不产生备份
(setq make-backup-files nil)
(setq auto-save-default -1)
(setq backup-inhibited t)

;;显示时间设置
;; (display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
;; (setq display-time-24hr-format t);;时间使用24小时制
;; (setq display-time-day-and-date t);;时间显示包括日期和具体时间



;;tabs用空格表示
;; (setq-default indent-tabs-mode nil)
;; (setq tab-width 4)
;; (setq c-basic-offset 4)

;;80列
(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)

;;设置cursor为坚线
(setq-default cusor-type 'bar)


;;当前行高亮
(global-hl-line-mode 1)
(set-face-background 'hl-line "#3e4446")


;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 最近的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10000)

;;设置字体
;; (set-default-font "Courier New-14")

;;文件在改变时自动加载
(global-auto-revert-mode t)



;;设置选中状态下的删除功能

;;设置代码缩进线
;;(require 'highlight-indent-guides)
;;(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;;(set-face-background 'highlight-indentation-face "#e3e3d3")
;;(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")



(provide 'init-base)
