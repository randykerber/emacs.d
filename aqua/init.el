;;;; emacs aquamacs init           -*- mode: emacs-lisp -*-
;;

(print "START aqua/init.el")

(setq debug-on-error t)

;; (package-initialize)

;; ==================================================
;; Packages
;; ==================================================

;; (load-file "~/.emacs.d/aqua/packages.el")
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))


;; ==================================================
;; line wrapping
;; ==================================================

(aquamacs-set-line-wrapping-in-text-modes)

;; ==================================================
;; ALL version of init.el
;; ==================================================

(setq *emacs-init-dir* "~/gh/randykerber/emacs.d")
(load (concat *emacs-init-dir* "/" "common" "/" "init.el"))

;; (load-file "~/.emacs.d/common/init.el")

(print "END   aqua/start.el")
