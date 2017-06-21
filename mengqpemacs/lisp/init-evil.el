;;开启evil模式
(require 'evil)
(evil-mode t)

;;开启C-x C-A可用 分别用C-c +/-代替
(require 'evil-numbers)

;;
;; (require 'evil-leader)
;; (global-evil-leader-mode)
;; (evil-leader/set-leader ",")

;; ;;
;; ;; Vim key bindings
;; (global-evil-leader-mode)
;; (evil-leader/set-key
;;   "ci" 'evilnc-comment-or-uncomment-lines
;;   "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
;;   "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
;;   "cc" 'evilnc-copy-and-comment-lines
;;   "cp" 'evilnc-comment-or-uncomment-paragraphs
;;   "cr" 'comment-or-uncomment-region
;;   "cv" 'evilnc-toggle-invert-comment-line-by-line
;;   "\\" 'evilnc-comment-operator ; if you prefer backslash key
;;   )

(require 'evil-visualstar)
(global-evil-visualstar-mode)

;; (require 'evil-search-highlight-persist)
;; (global-evil-search-highlight-persist t)


;;实现c-c++代码折叠
(add-hook 'c-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (hs-minor-mode 1)))

(add-hook 'dired-mode-hook
          (lambda( )
            (evil-emacs-state)))

(add-hook 'cscope-minor-mode-hooks
          (lambda( )
            (evil-emacs-state)))


(require 'evil-matchit)
(global-evil-matchit-mode 1)
(setq evilmi-ignore-comments nil)


(require 'evil-escape)
(evil-escape-mode t)
(setq-default evil-escape-key-sequence "jk")
(setq-default evil-escape-delay 0.2)




                                        ;(defun my-move-key (keymap-from keymap-to key)
                                        ;  "Moves key binding from one keymap to another, deleting from the old location. "
;  (define-key keymap-to key (lookup-key keymap-from key))
;  (define-key keymap-from key nil))
;(my-move-key evil-motion-state-map evil-normal-state-map (kbd "RET"))
;(my-move-key evil-motion-state-map evil-normal-state-map " ")


;; ;;change mode-line color by evil state
;; (lexical-let ((default-color (cons (face-background 'mode-line)
;;                                   (face-foreground 'mode-line))))
;;  (add-hook 'post-command-hook
;;            (lambda ()
;;              (let ((color (cond ((minibufferp) default-color)
;;                                 ((evil-insert-state-p) '("#e80000" . "#ffffff"))
;;                                 ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
;;                                 ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
;;                                 (t default-color))))
;;                (set-face-background 'mode-line (car color))
;;                (set-face-foreground 'mode-line (cdr color))))))


(define-key evil-normal-state-map (kbd "C-]") 'helm-cscope-find-this-symbol)
(define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "-") 'evil-numbers/dec-at-pt)

(provide 'init-evil)
