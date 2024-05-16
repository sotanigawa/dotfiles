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
 '(backup-directory-alist `((".*" . ,"~/.local/state/emacs/backups/")))
 '(auto-save-file-name-transforms `((".*" ,"~/.local/state/emacs/auto-saves/" t)))
 '(auto-save-list-file-prefix "~/.local/state/emacs/auto-saves/")
 ;; Editing
 '(indent-tabs-mode nil)
 ;; Miscellaneous
 '(vc-follow-symlinks nil)
 '(custom-file (locate-user-emacs-file "custom.el")))

;;; Faces
(custom-set-faces
 '(default ((t (:family "Cica" :height 140)))))

;;; Keymaps
(global-set-key (kbd "C-h") 'delete-backward-char)

;;; Package
(require 'package)
(custom-set-variables '(package-user-dir "~/.local/share/emacs/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;;; Use-Package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(custom-set-variables '(use-package-always-ensure t))

;;; Recentf and Savehist
(use-package recentf
  :custom
  (recentf-save-file "~/.local/state/emacs/recentf")
  (recentf-max-saved-items 1000)
  (recentf-auto-cleanup 'never)
  :config
  (global-set-key (kbd "C-x C-r") 'recentf)
  (recentf-mode))

(use-package savehist
  :custom
  (savehist-file "~/.local/state/emacs/history")
  :config
  (savehist-mode))

;;; Minibuffer Completion System
(use-package vertico
  :custom
  (vertico-count 20)
  :config
  (vertico-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind
  (:map vertico-map ("C-l" . vertico-directory-up)))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :config
  (marginalia-mode))

;;; DDSKK
(use-package ddskk
  :custom
  (skk-user-directory "~/.local/share/emacs/skk/")
  (skk-large-jisyo "/usr/share/skk/SKK-JISYO.L")
  (skk-cursor-hiragana-color "pink")
  (skk-dcomp-activate t)
  :bind
  ("C-x j" . 'skk-mode)
  :hook
  (isearch-mode . skk-isearch-mode-setup)
  (isearch-mode-end . skk-isearch-mode-cleanup))

;;; Doom-Themes
(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-dracula t))

;;; Doom-Modeline
(use-package doom-modeline
  :custom
  (doom-modeline-icon nil)
  :config
  (doom-modeline-mode))

;;; Init-Loader
(use-package init-loader
  :custom
  (init-loader-directory (locate-user-emacs-file "inits/"))
  (init-loader-show-log-after-init 'error-only)
  :config
  (when (file-directory-p init-loader-directory) (init-loader-load)))
