;;;;                 -*- mode: emacs-lisp -*-

;; (print "Loading common/keys.el ...")

(if (featurep 'aquamacs)

    (defun rk-set-key (key command)
      (define-key osx-key-mode-map key command))

  (defun rk-set-key (key command)
    (global-set-key key command))
    ;; (setq-default key command))
)

;;;; Make C-TAB and C-S-TAB cycle through buffers in the current window

(defun ken-next-buffer ()
  (interactive)
  (let ((choices (cdr (buffer-list))))
    ;; Skip hidden buffers like " *Minibuf-0*"
    (while (and (car choices)
                (or (get-buffer-window (car choices)) ;buffer already visible
                    (eq t (compare-strings (buffer-name (car choices)) 0 2 " *" 0 2))))
      (setq choices (cdr choices)))
    (when (car choices)
      (bury-buffer (car (buffer-list)))
      (switch-to-buffer (car choices)))))

(defun ken-prev-buffer ()
  (interactive)
  (let (choice
        (keep-going t))
    (while keep-going
      (setq choice
            (car (last (buffer-list))))
      (setq keep-going
            (or (get-buffer-window choice)
                (eq t (compare-strings (buffer-name choice) 0 2 " *" 0 2))))
      (switch-to-buffer choice))))

;; (defun ken-prev-buffer ()
;;   (interactive)
;;   (switch-to-buffer (car (last (buffer-list))))
;;   (while (eq t (compare-strings (buffer-name) 0 2 " *" 0 2))
;;     (switch-to-buffer (car (last (buffer-list))))))

;; (global-set-key [C-tab] 'ken-next-buffer)
;; (global-set-key [C-S-iso-lefttab] 'ken-prev-buffer)

(rk-set-key [C-tab] 'ken-next-buffer)
;; (rk-set-key [C-S-iso-lefttab] 'ken-prev-buffer)

;; (global-set-key [C-tab] 'bs-cycle-next)
;; (global-set-key [C-S-iso-lefttab] 'bs-cycle-previous)

;; (global-set-key [C-S-iso-lefttab] 'bs-cycle-next)

;; (global-set-key [(f9)] 'bs-cycle-previous)
;; (global-set-key [(f10)] 'bs-cycle-next)

;; (print "after ken-next-buffer")

;;; Commands to shorten:
;; c-x b <ret>
;; tags-search
;; c-i is set to TAB
;; c-m is RETURN

;; [(control ?\;)]  to encode c-;
;(global-set-key [?\M-\C-o] 'delete-other-windows)
;; (global-set-key "\M-o" 'other-window)
;; (define-key osx-key-mode-map (kbd "M-o") 'other-window)

(rk-set-key (kbd "M-o") 'other-window)
(rk-set-key (kbd "A-M-o") 'other-window)

;(global-set-key "\M-s" 'tags-search)

;; (global-set-key [?\M-\C-,] 'tags-search)
;; (global-set-key [?\C-\M-\;] 'comment-region)

(rk-set-key [?\M-\C-,] 'tags-search)

(rk-set-key [?\C-\M-\;] 'comment-region)

;; set the M-g function key to goto-line
(rk-set-key (kbd "\M-g") 'goto-line)

;(global-set-key [lwindow] 'event-apply-alt-modifier)

;; unused C-M- "mxyz,;']=

;; (rk-set-key [?\M-\C-m] 'tags-query-replace)

;;(global-set-key [?\C-c?\C-v?\C-h] 'jde-import-kill-extra-imports)
;;(global-set-key [?\C-c?\C-v?\C-u] 'jde-import-sort)

;;; Have 'space' key do filename coompletion.
;;
 (define-key minibuffer-local-filename-completion-map
   " " 'minibuffer-complete-word)

;;; To merge Emacs kill ring and clipboard
;;
;; (setq x-select-enable-clipboard t)

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer nil)
  )
;(global-set-key [?\C-\S-k] 'kill-current-buffer)
;; (global-set-key (kbd "C-S-K") 'kill-current-buffer)
;; (define-key osx-key-mode-map (kbd "C-S-k") 'kill-current-buffer)
;; (global-set-key (kbd "C-S-k") 'kill-current-buffer)
(rk-set-key (kbd "C-A-M-k") 'kill-current-buffer)
;; (rk-set-key (kbd "C-A-k") 'kill-current-buffer)
;; (rk-set-key (kbd "A-M-k") 'kill-current-buffer)
;; (define-key osx-key-mode-map "\C-K" 'kill-current-buffer)

;; (define-key osx-key-mode-map [?\C-\S-k] 'kill-current-buffer)


;;; Compare windows
(global-set-key "\C-cw" 'compare-windows)

(global-set-key "\C-x\C-b" 'buffer-menu)

;;; Keybinding for `occur'
; I use occur a lot, so let's bind it to a key:
(global-set-key "\C-co" 'occur)

(rk-set-key (kbd "A-M-m") 'count-matches)

;; Go to line N
;; (global-set-key (kbd "M-g") 'goto-line)
(rk-set-key (kbd "M-g") 'goto-line)

;; (print "Loading init/keys.el ...Done")

;;;;;;;;;;;;;;;;  END  ;;;;;;;;;;;;;;;;
