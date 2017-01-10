;;; packages.el --- mengqp-chinese-pyim layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: mengqp <mengqp@mengqp-VirtualBox>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `mengqp-chinese-pyim-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mengqp-chinese-pyim/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mengqp-chinese-pyim/pre-init-PACKAGE' and/or
;;   `mengqp-chinese-pyim/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mengqp-chinese-pyim-packages
  '(
    chinese-pyim
    chinese-pyim-wbdict
    )


  "The list of Lisp packages required by the mengqp-chinese-pyim layer.


Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun mengqp-chinese-pyim/init-chinese-pyim ()
  (use-package chinese-pyim
    :ensure nil
    :config
    ;; 激活 basedict 拼音词库
    (use-package chinese-pyim-basedict
      :ensure nil
      :config (chinese-pyim-basedict-enable))


    )
  )

;; 五笔用户使用 wbdict 词库
(defun mengqp-chinese-pyim/init-chinese-pyim-wbdict ()
  (use-package chinese-pyim-wbdict
    :ensure nil
    :config (chinese-pyim-wbdict-gbk-enable))
  )

(setq default-input-method "chinese-pyim")
(global-set-key (kbd "C-\\") 'toggle-input-method)

;; 我使用全拼
(setq pyim-default-scheme 'wubi)

;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
;; 我自己使用的中英文动态切换规则是：
;; 1. 光标只有在注释里面时，才可以输入中文。
;; 2. 光标前是汉字字符时，才能输入中文。
;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
;; (setq-default pyim-english-input-switch-functions
;;               '(pyim-probe-dynamic-english
;;                 pyim-probe-isearch-mode
;;                 pyim-probe-program-mode
;;                 pyim-probe-org-structure-template))

(setq-default pyim-punctuation-half-width-functions
              '(pyim-probe-punctuation-line-beginning
                pyim-probe-punctuation-after-punctuation))

;; 开启拼音搜索功能
(setq pyim-isearch-enable-pinyin-search t)

;; 使用 pupup-el 来绘制选词框
;; (setq pyim-page-tooltip 'popup)
(setq pyim-page-tooltip 'pos-tip)
(setq x-gtk-use-system-tooltips t)

;; 选词框显示5个候选词
(setq pyim-page-length 5)

;; 让 Emacs 启动时自动加载 pyim 词库
(add-hook 'emacs-startup-hook
          #'(lambda () (pyim-restart-1 t)))

(global-set-key "\M-j" 'pyim-convert-code-at-point)
;; (("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
;;  ("C-;" . pyim-delete-word-from-personal-buffer))
:bind
;;; packages.el ends here
