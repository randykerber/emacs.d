;;;; emacs brew init           -*- mode: emacs-lisp -*-
;;

;; (print "START brew/init.el")

(setq debug-on-error t)

;; (print (concat "system-type = " system-type))
;; (print "system-type =")
;; (print system-type)

;; ==================================================
;; Packages
;; ==================================================

;; (load-file "~/.emacs.d/brew/packages.el")

;; ==================================================
;; line wrapping
;; ==================================================

;; (aquamacs-set-line-wrapping-in-text-modes)

;; (setq custom-file "~/.emacs.d/brew/custom.el")


;; ==================================================
;; init.el that loads a bunch of init-* package dependencies.
;; ==================================================

(load "~/gh/randykerber/emacs.d/init.el")


;; ==================================================
;; COMMON version of init.el
;; ==================================================

(load (concat *emacs-init-dir* "/" "common" "/" "init.el"))


;; ==================================================
;; Mac OS Modifier keys
;; ==================================================

;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq ns-alternate-modifier 'meta)
  (setq ns-command-modifier 'alt)
     ;; (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )


;; (print "END   brew/init.el")
