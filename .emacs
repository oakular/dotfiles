;; ----- PACKAGES -----
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(setq user-full-name "Callum Warrilow"
      user-mail-address "callum@oakular.com")

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(fset 'yes-or-no-p 'y-or-n-p) ;; no need to type 'yes'

;; ----- STARTUP -----
(setq default-directory "~/Documents/")
(setq initial-buffer-choice "~/Documents/personal/mantra.org")

;; ----- EDITING -----
(setq-default major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq visible-bell t)
(setq-default fill-column 80)
(show-paren-mode 1)

;; ----- FRAME APPEARANCE -----
;; (tool-bar-mode -1)
(scroll-bar-mode -1)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fboundp 'toggle-frame-fullscreen)
  ;; Command-Option-f to toggle fullscreen mode
  ;; Hint: Customize `ns-use-native-fullscreen'
(global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen)
(setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 80)    ))
(set-face-attribute 'default nil :height 120)
(set-face-attribute 'default t :font "Hack" )

(load-theme 'solarized-light t)

;; ----- KEYBOARD & MOUSE CONFIG -----
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
;; Make mouse wheel / trackpad scrolling less jerky
  ;; (setq mouse-wheel-scroll-amount '(1
  ;;                                   ((shift) . 5)
  ;;                                   ((control))))

;; ----- DIRED CONFIG -----
(setq dired-listing-switches "-lur")

;; ----- HASKELL CONFIG -----
(setenv "PATH" "/usr/local/bin:/usr/bin:/bin:/usr/local/bin:/usr/local/bin/cabal")
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-log t)
(setq haskell-process-path-ghci "/usr/local/bin/ghci")
(setq haskell-process-path-cabal "/usr/local/bin/cabal")
;;(setq haskell-process-type 'ghci)

;; ----- MARKDOWN CONFIG -----
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)

(require 'smooth-scroll)
(smooth-scroll-mode 1)
(setq smooth-scroll/vscroll-step-size 5)

;; ----- ORG MODE -----
(require 'org)
(require 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(setq org-directory "~/Documents/org/")
(setq org-agenda-files '("~/Documents/org/plan/"
                         "~/Documents/org/refile.org"))
(setq org-agenda-nday 7)
(setq org-agenda-show-all-dates t)
(setq org-reverse-note-order t)
(setq org-enforce-todo-dependencies t)
;; --- org auditing options
(setq org-log-done t)
(setq org-log-done (quote time))
(setq org-log-redeadline (quote time))
(setq org-log-reschedule (quote time))

;; --- change priorities to quadrant numbers
(setq org-highest-priority 49)
(setq org-lowest-priority 52)
(setq org-default-priority 50)

(setq org-todo-keywords
      '((sequence "TODO" "DOING" "HOLD" "|" "DONE" "CANCELED")))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Documents/org/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/Documents/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/Documents/org/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/Documents/org/daily-review.org")
               "* Actions I am proud of:\n** ?\nActions I am not proud of:\n**\nHow to make tomorrow meaningful:\n**%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/Documents/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Documents/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/Documents/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/Documents/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

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
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(package-selected-packages
   (quote
    (writeroom-mode auctex smooth-scroll web-mode php-mode markdown-mode swift-mode solarized-theme magit haskell-mode org-edna))))
