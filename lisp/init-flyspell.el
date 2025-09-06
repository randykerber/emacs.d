;;----------------------------------------------------------------------------
;; Add spell-checking in comments for all programming language modes
;;----------------------------------------------------------------------------

;; Conditional flyspell activation that skips csv-mode
(defun maybe-enable-flyspell-prog-mode ()
  "Enable flyspell-prog-mode unless in csv-mode."
  (unless (eq major-mode 'csv-mode)
    (flyspell-prog-mode)))

(if (fboundp 'prog-mode)
    (add-hook 'prog-mode-hook 'maybe-enable-flyspell-prog-mode)
  (dolist (hook '(lisp-mode-hook
                  emacs-lisp-mode-hook
                  scheme-mode-hook
                  clojure-mode-hook
                  ruby-mode-hook
                  yaml-mode
                  python-mode-hook
                  shell-mode-hook
                  php-mode-hook
                  css-mode-hook
                  haskell-mode-hook
                  caml-mode-hook
                  nxml-mode-hook
                  crontab-mode-hook
                  perl-mode-hook
                  tcl-mode-hook
                  javascript-mode-hook))
    (add-hook hook 'maybe-enable-flyspell-prog-mode)))

(after-load 'flyspell
  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face))


(provide 'init-flyspell)
