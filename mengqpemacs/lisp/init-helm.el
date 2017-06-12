(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(require 'helm-ag)

(defun mengqp/helm-jump-in-buffer ()
  "Jump in buffer using `imenu' facilities and helm."
  (interactive)
  (call-interactively
   (cond
    ((eq major-mode 'org-mode) 'helm-org-in-buffer-headings)
    (t 'helm-semantic-or-imenu))))

(defvar dotspacemacs-search-tools '("ag" "pt" "ack" "grep"))

(defun mengqp//helm-do-search-find-tool (base tools default-inputp)
  "Create a cond form given a TOOLS string list and evaluate it."
  (eval
   `(cond
     ,@(mapcar
        (lambda (x)
          `((executable-find ,x)
            ',(let ((func
                     (intern
                      (format (if default-inputp
                                  "spacemacs/%s-%s-region-or-symbol"
                                "spacemacs/%s-%s")
                              base x))))
                (if (fboundp func)
                    func
                  (intern (format "%s-%s"  base x))))))
        tools)
     (t 'helm-do-grep))))

(defun mengqp/helm-file-do-ag (&optional _)
  "Wrapper to execute `helm-ag-this-file.'"
  (interactive)
  (helm-do-ag-this-file))

(defun mengqp/helm-file-smart-do-search (&optional default-inputp)
  "Search in current file using `dotspacemacs-search-tools'.
Search for a search tool in the order provided by `dotspacemacs-search-tools'
If DEFAULT-INPUTP is non nil then the current region or symbol at point
are used as default input."
  (interactive)
  (call-interactively
   (mengqp//helm-do-search-find-tool "mengqp/helm-file-do"
                                        dotspacemacs-search-tools
                                        default-inputp)))

(provide 'init-helm)
