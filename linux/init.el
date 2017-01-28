;;;; emacs linux init           -*- mode: emacs-lisp -*-
;;

;; (print "START linux/init.el")

(setq debug-on-error t)

(setq custom-file (concat *emacs-init-dir* "/" "linux" "/" "custom.el"))

(load custom-file)

;; ==================================================
;; Packages
;; ==================================================

;; (load-file "~/.emacs.d/linux/packages.el")

;; ==================================================
;; line wrapping
;; ==================================================

;; (aquamacs-set-line-wrapping-in-text-modes)

;; (setq custom-file "~/.emacs.d/linux/custom.el")

;; (print (concat "system-type = " system-type))
;; (print "system-type =")
;; (print system-type)


;; ==================================================
;; init.el that loads a bunch of init-* package dependencies.
;; ==================================================

;; (load (concat *emacs-init-dir* "/" "init.el"))


;; ==================================================
;; COMMON version of init.el
;; ==================================================

(load (concat *emacs-init-dir* "/" "common" "/" "init.el"))


;; ==================================================
;; Mac OS Modifier keys
;; ==================================================

;; key bindings
;; (when (eq system-type 'darwin) ;; mac specific settings
;;   (setq ns-alternate-modifier 'meta)
;;   (setq ns-command-modifier 'alt)
;;   ;; (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
;;   )


;; (print "END   linux/init.el")
