(require 'package)

;https://gist.github.com/rkneufeld/5126926
(package-initialize)

(add-to-list 'package-archives
  '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))

(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))


(setq initial-scratch-message nil)        
(when (locate-library "clojure-mode")     
  (setq initial-major-mode 'clojure-mode))


(setq package-check-signature nil)

(setq my-packages
      '(clojure-mode
	paredit
	company
	popup
	rainbow-mode))



(when (not package-archive-contents)
	(package-refresh-contents))

(dolist (p  my-packages)
	 (unless (package-installed-p p)
	   do (package-install p)))

; Manual load the cider package
(add-to-list 'load-path "~/.emacs.d/cider-0.9.1")
(require 'cider)
(require 'cider-grimoire)

(global-company-mode)
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "<em>nrepl</em>")
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; paredit
(add-hook 'clojure-mode-hook 'paredit-mode)

;; My Customization
(show-paren-mode 1)
(setq visible-bell 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'hbar)


(load-theme 'zenburn t)
(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-x <left>")  'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <up>")    'windmove-up)
(global-set-key (kbd "C-x <down>")  'windmove-down)

;; nREPL customizations
(setq nrepl-hide-special-buffers nil)         
(setq nrepl-popup-on-error nil)             
(setq nrepl-popup-stacktraces-in-repl t)    


;; Switch frame using F8
(global-set-key [f8] 'other-frame)
(global-set-key [f7] 'paredit-mode)
(global-set-key [f9] 'cider-jack-in)
(global-set-key [f11] 'speedbar)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;; Initialize all the ELPA packages (what is installed using the packages commands)
(package-initialize)

;; Custom key bindings
;; Rebinding increase and decrease window size
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)


;; M-x customize(-group) ++ ?
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
