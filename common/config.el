;;;; emacs.d common config.el                -*- mode: emacs-lisp -*-

(print "START common/init.el")

(setq debug-on-error t)


;;(require 'better-defaults)

(when (is-mac)
  (setq
   ns-auto-hide-menu-bar t
   ;; ns-tool-bar-display-mode (quote both) t
   ;; ns-tool-bar-size-mode (quote regular) t
   ))

(menu-bar-mode -1)
(tool-bar-mode -1)

(setq dired-dwim-target t
      fill-column 96
      font-lock-global-modes t
      indent-tabs-mode nil
      next-line-add-newlines t
      require-final-newline t
      tab-width 4
      track-eol t
      user-mail-address "randy@randykerber.com"
      )

(defalias 'yes-or-no-p 'y-or-n-p)

;;;
;;; Nice options to have On by default
;;;
(mouse-wheel-mode t)			; activate mouse scrolling
;(global-font-lock-mode t)		; syntax highlighting
(transient-mark-mode t)			; sane select (mark) mode
(delete-selection-mode t)		; entry deletes marked text
(show-paren-mode t)			; match parentheses
;; (add-hook 'text-mode-hook 'turn-on-auto-fill) ; wrap long lines in text mode

;;;;================================================================
;;;;  font-lock
;;;;================================================================

(global-font-lock-mode 1)

                                        ;(add-hook 'after-init-hook
                                        ;          '(lambda ()
                                        ;             (global-font-lock-mode 1)
                                        ;	     ;;; winter: uncomment
                                        ;             ;; (require 'exec-path-from-shell)
                                        ;             ))

                                        ;(require 'font-lock)


;; ==================================================
;; line wrapping
;; ==================================================

(when (is-aqua)
  (aquamacs-set-line-wrapping-in-text-modes))


;;;;================================================================
;;;;  Text Mode
;;;;================================================================

;; (smart-spacing-mode t)
;; (add-hook 'text-mode-hook 'smart-spacing-mode)

;; (remove-hook 'text-mode-hook 'smart-spacing-mode)
;; (remove-hook 'text-mode-hook 'auto-detect-wrap)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill) ; wrap long lines in text mode
;; (add-hook 'text-mode-hook 'turn-on-word-wrap)

;; (print (format "text mode hook = %S" text-mode-hook))


;; ==================================================
;;  minibuffer filename Completion
;; ==================================================

(if (boundp 'minibuffer-local-filename-completion-map)
    (define-key minibuffer-local-filename-completion-map " " 'minibuffer-complete-word))

(if (boundp 'minibuffer-local-must-match-filename-map)
    (define-key minibuffer-local-must-match-filename-map " " 'minibuffer-complete-word))


;;;;================================================================
;;;;  dired
;;;;================================================================

;; (require 'dired-x)


;;;;================================================================
;;;;  YAML
;;;;================================================================

;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Unlike python-mode, this mode follows the Emacs convention of not
;; binding the ENTER key to `newline-and-indent'.  To get this
;; behavior, add the key definition to `yaml-mode-hook':

;; (add-hook 'yaml-mode-hook
;;           '(lambda ()
;;              (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


;;;;================================================================
;;;;  Tramp
;;;;================================================================

;; (defun sudo ()
;;   "Use TRAMP to `sudo' the current buffer" (interactive)
;;   (when buffer-file-name
;;     (find-alternate-file
;;      (concat "/sudo:root@localhost:"
;;              buffer-file-name))))

;;;;================================================================
;;;; smart-mode-line
;;;;================================================================

;; (sml/setup)

;;;;================================================================
;;;;================================================================

(print "END   common/config.el")
