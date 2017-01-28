;;;; emacs init.el                -*- mode: emacs-lisp -*-

;; (print "loading ~/.emacs.d/init.el")

(setq debug-on-error t)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

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

(load (concat *emacs-init-dir* "/" *emacs-context* "/" "init.el"))
