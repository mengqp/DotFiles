
(require 'org)

(setq org-src-fontify-natively t)

(setq org-tag-alist '(("@bug" . ?b) ("@feature" . ?f) ("@repeat" . ?r) ("@invalid" . ?i) ("@wontfix" . ?w) ("@discuss" . ?d) ("@suspend" . ?s) ("@close" . ?c) ("@Fixed" . ?F)))
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
(setq org-agenda-files (list "~/ecode/em770/readme.org"
                             "~/ecode/epduhmi/readme.org"
                             "~/ecode/epduhmi/3352/asrc/readme.org"
                             "~/ecode/epduhmi/3352/dsrc/readme.org"
                             ))

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

; automatically add ids to saved org-mode headlines
(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      (lambda ()
                        (when (and (eq major-mode 'org-mode)
                                   (eq buffer-read-only nil))
                          (eos/org-add-ids-to-headlines-in-file))))))

(provide 'init-org)