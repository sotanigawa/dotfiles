;;; -*- lexical-binding: t; -*-

;;; ui
(setq default-frame-alist
      '((menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (vertical-scroll-bars . nil)))

;;; packages
(setq package-user-dir "~/.local/share/emacs/elpa/")
(when (fboundp 'startup-redirect-eln-cache)
  (startup-redirect-eln-cache "~/.cache/emacs/eln-cache/"))
