;;; packages.el --- mengqp-google-c-style layer packages file for Spacemacs.
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
;; added to `mengqp-google-c-style-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `mengqp-google-c-style/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `mengqp-google-c-style/pre-init-PACKAGE' and/or
;;   `mengqp-google-c-style/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst mengqp-google-c-style-packages
  '(
    google-c-style
    )

  "The list of Lisp packages required by the mengqp-google-c-style layer.

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


;; (setq mengqp-google-c-style-packages
;;       '(
;;         google-c-style
;;         ))

;; (setq google-c-style-excluded-package '())
;; (defun mengqp-google-c-style-packages/init-google-c-style ()
;;   (use-package google-c-style
;;     ))

(defun mengqp-google-c-style/init-google-c-style ()
  (use-package google-c-style
    :commands
    (cscope-index-files cscope/run-pycscope)
    :init
    (progn
      (defun my-c-mode-hook ()
        (setq c-basic-offset 4          ;; 基本缩进宽度
              indent-tabs-mode nil        ;; 禁止空格替换Tab
              default-tab-width 4
              ))     ;; 默认Tab宽度
      )))

(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; (add-hook 'c-mode-common-hook 'my-c-mode-hook)
; (add-hook 'c++-mode-common-hook 'google-set-c-style)
; (add-hook 'c++-mode-common-hook 'google-make-newline-indent)
; (add-hook 'c++-mode-common-hook 'my-c-mode-hook)


;;; packages.el ends here


