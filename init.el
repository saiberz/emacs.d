;;; Code:

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Set path to dependencies
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq user-lisp-dir
      (expand-file-name "user-lisp" user-emacs-directory))

(setq elget
      (expand-file-name "elget" user-emacs-directory))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path site-lisp-dir)
(add-to-list 'load-path user-lisp-dir)
(add-to-list 'load-path elget)


;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)

;; Write backup files to own directory
;(setq backup-directory-alist
;      `(("." . ,(expand-file-name
;                 (concat user-emacs-directory "backups")))))


;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")


;;

;; Setup packages
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(dired-details
     auto-complete
     gist
     yasnippet
     flx-ido
     ido-ubiquitous
;     evil
;     evil-visualstar
;     surround
     smartparens
     rainbow-delimiters
     magit
     git-gutter
     helm
     helm-themes
     helm-c-yasnippet
     perspective
     projectile
     helm-projectile
     helm-projectile-all
     multi-term
     exec-path-from-shell
     whitespace-cleanup-mode
     saveplace
;     vagrant
     browse-kill-ring
     guide-key
     expand-region
     diminish
     pretty-mode
     org-plus-contrib
     jabber
     twittering-mode
     itail
     prodigy
     restclient
     switch-window
     undo-tree
     erc

     ;;org
     ox-html5slide

     ;;deps for ipython
     markdown-mode
     markdown-mode+

     ;;Web
     angular-snippets

     ;; Matlab
     matlab-mode

     ;; OSX
     erc-terminal-notifier
     dash-at-point

     ;; Clojure
     ;;     ac-nrepl
     elein
     cider
;;     cider-tracing
     clj-refactor
     clojure-cheatsheet
     clojure-snippets
     latest-clojure-libraries
     align-cljlet
     slamhound
     midje-mode

     ;; YAML
     yaml-mode

     ;; HTML
     emmet-mode
     js2-refactor
     tern
     tern-auto-complete

     ;; Python
     virtualenvwrapper
     flycheck
;;     ein
;     python-mode

     ;; Websocket
     websocket
     request

     ;; Others
     helm-spotify

     ;; Coffeescript
     coffee-mode

     ;; Javascript
     js2-mode
     js2-refactor
     ac-js2
     skewer-mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Setup Key bindings
(require 'key-bindings)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; Load PATH from shell
;(when (memq window-system '(mac ns))
;  (exec-path-from-shell-initialize))

; Load user specific configuration
(when (file-exists-p user-lisp-dir)
  (mapc 'load (directory-files user-lisp-dir nil "^[^#].*el$")))
