;; helm
(global-set-key [f11] 'switch-full-screen)

(global-set-key (kbd "<menu>") 'helm-overlord)
(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "C-<SPC>") 'helm-M-x)
;(global-set-key (kbd "C-§") 'helm-yas-complete)

;;Webjump
(global-set-key (kbd "C-x g") 'webjump)

;;Switch window
(global-set-key (kbd "C-x o") 'switch-window)

;;Edit
(defun delete-line-no-kill ()
  (interactive)
  (delete-region
   (point)
   (save-excursion (move-end-of-line 1) (point)))
  (delete-char 1)
)
(global-set-key (kbd "M-1") 'delete-line-no-kill)

;; Org
;(global-set-key "\C-cl" 'org-store-link)
;(global-set-key "\C-cc" 'org-capture)
;(global-set-key "\C-ca" 'org-agenda)
;(global-set-key "\C-cb" 'org-iswitchb)

;; decent navigation like a good citizen
;(global-set-key (kbd "<C-tab>") 'persp-cycle-next)
;(global-set-key (kbd "<C-S-tab>") 'persp-cycle-prev)

;; dash
;(global-set-key "\C-cd" 'dash-at-point)
;(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; other goodies
;(global-set-key (kbd "C-x C-y") 'kill-ring-ido)
;(global-set-key (kbd "C-'") 'multi-term-dedicated-toggle)
;(global-set-key (kbd "C-c g") 'magit-status)
;(global-set-key (kbd "C-c s") 'gist-region-or-buffer-private)
;(global-set-key (kbd "C-\\") 'er/expand-region)

;; prevent madness
;(global-set-key (kbd "C-x 2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
;(global-set-key (kbd "C-x 3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))

;; smartparens
;(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
;(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

;(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
;(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
;(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
;(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

;; (define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
;; (define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
;; (define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
;; (define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

;; (define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
;; (define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

;; (define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
;; (define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

;; (define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
;; (define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

;; (define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
;; (define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
;; (define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
;; (define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

;; (define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
;; (define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
;; (define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
;; (define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

;; (define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
;; (define-key sp-keymap (kbd "C-<left_bracket>") 'sp-select-previous-thing)
;; (define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

;; (define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
;; (define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

;; (define-key sp-keymap (kbd "H-t") 'sp-prefix-tag-object)
;; (define-key sp-keymap (kbd "H-p") 'sp-prefix-pair-object)
;; (define-key sp-keymap (kbd "H-s c") 'sp-convolute-sexp)
;; (define-key sp-keymap (kbd "H-s a") 'sp-absorb-sexp)
;; (define-key sp-keymap (kbd "H-s e") 'sp-emit-sexp)
;; (define-key sp-keymap (kbd "H-s p") 'sp-add-to-previous-sexp)
;; (define-key sp-keymap (kbd "H-s n") 'sp-add-to-next-sexp)
;; (define-key sp-keymap (kbd "H-s j") 'sp-join-sexp)
;; (define-key sp-keymap (kbd "H-s s") 'sp-split-sexp)

;; use windmove to navigate between windows easily
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))



(provide 'key-bindings)
