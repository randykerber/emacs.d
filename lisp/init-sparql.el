
;; (defun sanityinc/pop-to-sqli-buffer ()
;;   "Switch to the corresponding sqli buffer."
;;   (interactive)
;;   (if sql-buffer
;;       (progn
;;         (pop-to-buffer sql-buffer)
;;         (goto-char (point-max)))
;;     (sql-set-sqli-buffer)
;;     (when sql-buffer
;;       (sanityinc/pop-to-sqli-buffer))))

(add-to-list 'load-path "~/gh/randykerber/emacs.d/elpa/sparql-mode-2.0.1")
(autoload 'sparql-mode "sparql-mode.el"
    "Major mode for editing SPARQL files" t)
(add-to-list 'auto-mode-alist '("\\.sparql$" . sparql-mode))
(add-to-list 'auto-mode-alist '("\\.rq$" . sparql-mode))

;; (after-load 'sparql
;;   (define-key sparql-mode-map (kbd "C-c C-z") 'sanityinc/pop-to-sqli-buffer)
;; )

(setq-default sparql-input-ring-file-name
              (expand-file-name ".sparqli_history" user-emacs-directory))

(after-load 'sparql-mode
            (org-babel-do-load-languages
             'org-babel-load-languages
             '((sparql . t)))
            )

;; (after-load 'page-break-lines
;;   (push 'sparql-mode page-break-lines-modes))

;; You can then execute the query by pressing C-c C-c on the source-block header.

;; By default results formatted as text/csv will be converted to an org table. This can be disabled by adding :results scalar to the header. See examples.

;; #+BEGIN_SRC sparql :url http://live.dbpedia.org/sparql :format text/csv
;;   SELECT DISTINCT ?Concept WHERE {
;;     [] a ?Concept
;;   } LIMIT 5
;; #+END_SRC


(provide 'init-sparql)
