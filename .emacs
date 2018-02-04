(setq user-full-name "Callum Warrilow"
      user-mail-address "callum@oakular.com")

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(fset 'yes-or-no-p 'y-or-n-p) ;; no need to type 'yes'

;; ----- EDITING -----
(setq-default indent-tabs-mode nil)
(setq visible-bell t)

;; ----- FRAME APPEARANCE -----
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(fboundp 'toggle-frame-fullscreen)
  ;; Command-Option-f to toggle fullscreen mode
  ;; Hint: Customize `ns-use-native-fullscreen'
(global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen)

;; ----- KEYBOARD & MOUSE CONFIG -----
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
;; Make mouse wheel / trackpad scrolling less jerky
  (setq mouse-wheel-scroll-amount '(1
                                    ((shift) . 5)
                                    ((control))))

;; ----- DIRED CONFIG -----
(setq dired-listing-switches "-lur")

;; ----- HASKELL CONFIG -----
(setenv "PATH" "/usr/local/bin:/usr/bin:/bin:/usr/local/bin:/usr/local/bin/cabal")
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-log t)
(setq haskell-process-path-ghci "/usr/local/bin/ghci")
(setq haskell-process-path-cabal "/usr/local/bin/cabal")
;;(setq haskell-process-type 'ghci)

;; ----- PACKAGES -----
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (solarized-theme magit haskell-mode org-edna))))
