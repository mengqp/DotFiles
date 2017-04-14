
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

;;启用时间显示设置，在minibuffer上面的那个杠上
(display-time-mode 1)
(defface egoge-display-time
  '((((type x w32 mac))
     ;; #060525 is the background colour of my default face.
     (:foreground "#060525" :inherit bold))
    (((type tty))
     (:foreground "blue")))

  "Face used to display the time in the mode line.")

;; This causes the current time in the mode line to be displayed in
;; `egoge-display-time-face' to make it stand out visually.
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " ")
                    'face 'egoge-display-time)))


(which-function-mode)
(setq-default header-line-format
              '((which-func-mode ("" which-func-format " "))))

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

(setq org-tag-alist '(("@bug" . ?b) ("@feature" . ?f) ("@wontfix" . ?w) ("@repeat" . ?r) ("@invalid" . ?i) ("@discuss" . ?d) ("@suspend" . ?s)))
;; 不同tag外观
(setq org-tag-faces
      '(("@bug" . (:background "red" :foreground "white" :weight bold))
        ("@feature" . (:background "DarkOrange" :foreground "white" :weight bold))
        ("@discuss" . (:background "yellow" :foreground "DarkGreen" :weight bold))
        ("@suspend" . (:background "yellow" :foreground "DarkGreen" :weight bold))
        ("@wontfix" . (:background "DodgerBlue" :foreground "black" :weight bold))
        ("@repeat" . (:background "SkyBlue" :foreground "black" :weight bold))
        ("@invalid" . (:background "SkyBlue" :foreground "black" :weight bold))
        ))
;; 设置todo
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "ISSUE(i@/!)" "|" "ISSUECLOSE(I@/!)" "DONE(d!/!)")
              (sequence "RELEASE(r@/!)" "|" "CANCELLED(c@/!)")
              )))

;; 设置agent文件表
(setq org-agenda-files (list "~/ecode/em770/readme.org" "~/ecode/epduhmi/readme.org"))

;; (require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
(defun eos/org-custom-id-get (&optional pom create prefix)
  "Get the CUSTOM_ID property of the entry at point-or-marker POM.
   If POM is nil, refer to the entry at point. If the entry does
   not have an CUSTOM_ID, the function returns nil. However, when
   CREATE is non nil, create a CUSTOM_ID if none is present
   already. PREFIX will be passed through to `org-id-new'. In any
   case, the CUSTOM_ID of the entry is returned."
  (interactive)
  (org-with-point-at pom
    ;; (let ((id (org-entry-get nil "CUSTOM_ID")))
    (let ((id (org-entry-get nil "CUSTOM_ID")))
      (cond
       ((and id (stringp id) (string-match "\\S-" id))
        id)
       (create
        (setq id (org-id-new (concat prefix "h")))
        (org-entry-put pom "CUSTOM_ID" id)
        (org-id-add-location id (buffer-file-name (buffer-base-buffer)))
        id)))))
;; (defun eos/org-add-ids-to-headlines-in-file ()
;;   "Add CUSTOM_ID properties to all headlines in the
;;    current file which do not already have one."
;;   (interactive)
;;   (org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))

(defun eos/org-add-ids-to-headlines-in-file ()
  "Add CUSTOM_ID properties to all headlines in the current
   file which do not already have one. Only adds ids if the
   `auto-id' option is set to `t' in the file somewhere. ie,
   #+OPTIONS: auto-id:t"
  (interactive)
  (save-excursion
    (widen)
    (goto-char (point-min))
    (when (re-search-forward "^#\\+OPTIONS:.*auto-id:t" (point-max) t)
      (org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))))

;; automatically add ids to saved org-mode headlines
;; (add-hook 'org-mode-hook
;;           (lambda ()
;;             (add-hook 'before-save-hook
;;                       (lambda ()
;;                         (when (and (eq major-mode 'org-mode)
;;                                    (eq buffer-read-only nil))
;;                           (eos/org-add-ids-to-headlines-in-file))))))


;; 设置jk也是escape
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)

;; 设置了这一句可以编org-present 不知道什么原因
(setq package-check-signature nil)

;; (defalias 'display-buffer-in-major-side-window 'window--make-major-side-window)
