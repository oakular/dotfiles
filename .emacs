(setq user-full-name "Callum Warrilow"
      user-mail-address "callum@oakular.com")

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(fset 'yes-or-no-p 'y-or-n-p) ;; no need to type 'yes'
(setq visible-bell t)

;; ----- FRAME APPEARANCE -----
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-face-attribute 'default nil :height 100)
;; (load-theme 'solarized-light)
;; (setq solarized-high-contrast-mode-line t)
(setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 80)))

;; ----- DIRED CONFIG -----
(setq dired-listing-switches "-lura")

;; ----- PACKAGES -----
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
