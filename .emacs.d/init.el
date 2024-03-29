;;; Variables
(custom-set-variables
 ;; Entering and Exiting
 '(inhibit-startup-screen t)
 '(confirm-kill-emacs 'y-or-n-p)
 ;; Controlling the Display
 '(scroll-preserve-screen-position 'always)
 '(show-trailing-whitespace t)
 '(line-number-mode t)
 '(column-number-mode t)
 '(global-hl-line-mode t)
 '(global-display-line-numbers-mode t)
 ;; Frames and Graphical Displays
 '(mouse-wheel-scroll-amount '(2 ((shift) . 4) ((control))))
 '(mouse-wheel-progressive-speed nil)
 '(scroll-bar-mode nil)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(tab-bar-mode t)
 '(use-dialog-box nil)
 ;; Backup and Auto-Save Files
 '(temporary-file-directory (locate-user-emacs-file "temp/"))
 '(backup-directory-alist `((".*" . ,temporary-file-directory)))
 '(auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
 '(auto-save-list-file-prefix temporary-file-directory)
 ;; Recentf
 '(recentf-mode t)
 '(recentf-save-file (locate-user-emacs-file "share/recentf"))
 '(recentf-max-saved-items 1000)
 ;; Editing
 '(indent-tabs-mode nil)
 '(show-paren-mode t)
 ;; Savehist
 '(savehist-mode t)
 '(savehist-file (locate-user-emacs-file "share/history"))
 ;; Miscellaneous
 '(load-prefer-newer t)
 '(vc-follow-symlinks t)
 '(custom-file (locate-user-emacs-file "custom.el")))

;;; Faces
(custom-set-faces
 '(default ((t (:family "Cica" :height 140)))))

;;; Keymaps
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-x C-r") 'recentf)

;;; Package System
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Minibuffer Completion System
(use-package vertico
  :ensure t
  :custom
  (vertico-count 20)
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;;; DDSKK
(use-package ddskk
  :ensure t
  :custom
  (skk-user-directory (locate-user-emacs-file "share/skk/"))
  (skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
  (skk-cursor-hiragana-color "pink")
  (skk-dcomp-activate t)
  :bind
  (("C-x j" . 'skk-mode))
  :hook
  ((isearch-mode . skk-isearch-mode-setup)
   (isearch-mode-end . skk-isearch-mode-cleanup)))

;;; Doom-Themes
(use-package doom-themes
  :ensure t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-dracula t))

;;; Doom-Modeline
(use-package doom-modeline
  :ensure t
  :custom
  (doom-modeline-icon nil)
  :init
  (doom-modeline-mode))

;;; Init-Loader
(use-package init-loader
  :ensure t
  :custom
  (init-loader-directory (locate-user-emacs-file "inits/"))
  (init-loader-show-log-after-init 'error-only)
  :config
  (when (file-directory-p init-loader-directory) (init-loader-load)))
