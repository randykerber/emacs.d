;;;; emacs init                -*- mode: emacs-lisp -*-

(setq debug-on-error t)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

;;(load "~/.emacs.d/start.el")
;; Have to add (provided 'emacs-modified) to Emacs.app installation for following to work.

(print "features = ")
(print features)
;; (print "(featurep 'version-modified) = ")
;; (print (featurep 'version-modified))


(setq *emacs-init-dir* "~/gh/randykerber/emacs.d")

(setq *emacs-context*
      (cond ((featurep 'aquamacs)
             "aqua")

            ;; ((featurep 'emacs-modified)
            ;;  "mod")
            
            ;; ((featurep 'version-modified)
            ;;  "mod")
            
            ((string-match "linux" (symbol-name system-type))
             "linux")
            
            ((featurep 'linux)
             "linux")
            
            (t
             "brew"))
      )

(setq user-emacs-directory (concat *emacs-init-dir* "/" *emacs-context* "/"))

(load (concat user-emacs-directory "init.el"))

(setq *emacs-common-dir* (concat *emacs-init-dir* "/" "common" "/"))

(load (concat *emacs-common-dir* "init.el"))

;;(add-to-list 'load-path "~/.emacs.d")
