;;;; emacs default.el                -*- mode: emacs-lisp -*-

;; (print "loading linux/default.el")

(setq debug-on-error t)

(setq custom-file "~/.emacs.d/brew/custom.el")

;; (load-file "~/.emacs.d/all/default.el")
(setq *emacs-init-dir* "~/gh/randykerber/emacs.d")
(load (concat *emacs-init-dir* "/" "common" "/" "default.el"))


;; (print "end   linux/default.el")
