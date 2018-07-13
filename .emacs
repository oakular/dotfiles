;; ----- PACKAGES -----
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(setq user-full-name "Callum Warrilow"
      user-mail-address "callum@oakular.com")

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(fset 'yes-or-no-p 'y-or-n-p) ;; no need to type 'yes'

;; ----- STARTUP -----
(setq default-directory "~/Documents/")
(setq initial-buffer-choice "~/Documents/personal/mantra.org")

;; ---- ALTERING $PATH -----
;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
;; (setq exec-path (append exec-path '("/usr/local/bin")))
;; (setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))
;; (setq exec-path (append exec-path '(":/Library/TeX/texbin")))
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; ----- ESHELL -----
(setq eshell-buffer-name "esh")
(setq eshell-modify-global-environment t)
(setq eshell-prefer-lisp-functions t)
(setq eshell-rc-script "~/.eshell/profile")
(setq Man-notify-method 'bully)

;; ----- EDITING -----
(setq-default major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq visible-bell t)
(setq-default fill-column 80)
(show-paren-mode 1)
(setenv "DICTIONARY" "en_GB")
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ----- FRAME APPEARANCE -----
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq display-time-format "[CL: %H:%M]")
(display-time-mode t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(fboundp 'toggle-frame-fullscreen)
  ;; Command-Option-f to toggle fullscreen mode
  ;; Hint: Customize `ns-use-native-fullscreen'
(global-set-key (kbd "M-ƒ") 'toggle-frame-fullscreen)
(setq initial-frame-alist '((top . 0) (left . 0) (width . 160) (height . 70)    ))
(set-face-attribute 'default nil :height 110)
(set-face-attribute 'default t :font "Hack" )

(setq markdown-header-face "Georgia")

(setq solarized-use-variable-pitch nil
      solarized-scale-org-headlines nil)
(setq solarized-high-contrast-mode-line t)
(setq solarized-distinct-fringe-background t)
(load-theme 'solarized-light t)

;; ----- KEYBOARD & MOUSE CONFIG -----
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
;; Make mouse wheel / trackpad scrolling less jerky
  ;; (setq mouse-wheel-scroll-amount '(1
  ;;                                   ((shift) . 5)
  ;;                                   ((control))))

;; ----- DIRED CONFIG -----
(require 'dired)
(setq dired-listing-switches "-lurh")
(setq dired-async-mode t)
(setq dired-isearch-filenames t)
(setq dired-use-ls-dired nil)
(define-key dired-mode-map  (kbd "i") 'dired-subtree-toggle)
(setq dired-subtree-use-backgrounds nil)

;; ----- HASKELL CONFIG -----
;;(setenv "PATH" "/usr/local/bin:/usr/bin:/bin:/usr/local/bin:/usr/local/bin/cabal")
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(setq haskell-process-log t)
(setq haskell-process-path-ghci "/usr/local/bin/ghci")
(setq haskell-process-path-cabal "/usr/local/bin/cabal")
;;(setq haskell-process-type 'ghci)

;; ----- ELIXIR CONFIG -----
(require 'elixir-mode)
(add-to-list 'elixir-mode-hook
             (defun auto-activate-ruby-end-mode-for-elixir-mode ()
               (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
                    "\\(?:^\\|\\s-+\\)\\(?:do\\)")
               (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
               (ruby-end-mode +1)))

;; ----- PHP CONFIG -----
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(setq-default indent-tabs-mode nil)
(defun my-web-mode-hook ()
  "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-indent-style 4)
)
(add-hook 'web-mode-hook  'my-web-mode-hook)
(add-hook 'web-mode-hook
          '(lambda ()
             (auto-complete-mode t)
             (require 'ac-php)
             (setq ac-sources  '(ac-source-php ) )
             (yas-global-mode 1)

             (ac-php-core-eldoc-setup ) ;; enable eldoc
             (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
             (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
             ))

(eval-after-load 'flycheck
  '(progn
     (flycheck-define-checker web-mode-php
       "This is the same as the default php checker except just for web-mode.
It continues checking for javascript errors if there are no more PHP errors."
       :command ("php" "-l" "-d" "error_reporting=E_ALL" "-d" "display_errors=1" "-d" "log_errors=0" source)
       :error-patterns ((error line-start (or "Parse" "Fatal" "syntax") " error" (any ":" ",") " " (message) " in " (file-name) " on line " line line-end))
       :modes (web-mode))

     (add-to-list 'flycheck-checkers 'web-mode-php)
     ))

;; ----- SQL CONFIG -----
(require 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)

(provide 'flycheck-web-mode-php)

;; ----- MARKDOWN CONFIG -----
(add-hook 'markdown-mode-hook 'turn-on-auto-fill)
(setq markdown-hide-markup 1)
;;(setq 'markdown-pre-face "Georgia")

;; ----- BLOGGING -----
(setq easy-jekyll-basedir "~/Documents/projects/writing/blog/")

(require 'smooth-scroll)
(smooth-scroll-mode 1)
(setq smooth-scroll/vscroll-step-size 5)

;; ----- EPUB READING -----
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Georgia"
                                           :height 1.2))
(add-hook 'nov-mode-hook 'my-nov-font-setup)
(setq nov-text-width 80)


;; ----- MAGIT CONFIG -----
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(setq global-magit-file-mode t)

;; ----- ORG MODE -----
;; (setcar (nthcdr 4 org-emphasis-regexp-components) 4)

(require 'org)
(require 'org-capture)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-to-list 'org-modules 'org-habit t)

(setq org-startup-indented t)
(setq org-hide-emphasis-markers t)
(setq org-footnotes-auto-adjust t)

(setq org-attach-method "ln")

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(setq org-directory "~/Documents/org/")
(setq org-mobile-directory "~/Documents/Dropbox/Apps/MobileOrg")
(setq org-mobile-inbox-for-pull "~/Documents/org/refile.org")
(setq org-agenda-files '("~/Documents/org/plan/"
                         "~/Documents/org/refile.org"))
(setq org-agenda-diary-file (concat org-directory "daily-review.org"))

(setq org-archive-location (concat org-directory "archive/%s_archive::"))

(setq org-agenda-nday 7)
(setq org-agenda-window-setup 'only-window)
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
      '((sequence "TODO(t)" "DOING(o)" "HOLD(h)" "|" "DONE(d!)" "CANCELLED(c)")))

(setq org-default-notes-file (concat org-directory "refile.org"))

(setq org-capture-templates
      (quote (
              ("t" "TODO Item"
               entry (file+headline org-default-notes-file "Tasks")
               "* TODO %?\n %i\n %a")

              ("r" "respond"
               entry (file org-default-notes-file)
               "* Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n")

              ("s" "web search"
               entry (file "~/Documents/org/web-searches.org")
               "* Search for %?\n%a")
              
              ("n" "note"
               entry (file+headline org-default-notes-file "Notes")
               "* NOTE: %?\n%U\n%a\n")

              ("j" "Journal"
               entry (file+datetree "~/Documents/org/daily-review.org")
               (file "~/.emacs.d/org-templates/journal.orgtmpl"))

              ("w" "org-protocol"
               entry (file "~/Documents/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)

              ("m" "Meeting"
               entry (file+headline org-default-notes-file "Meetings")
               "* MEETING with %? r.e \n%U")

              ("p" "Contact"
               entry (file+headline org-default-notes-file "Contact")
               "* Message/Phone %? \n%U")

              ("h" "Habit" entry (file "~/Documents/org/plan/habits.org")
               "* TODO %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:END:\n"))))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
;; (org-babel-do-load-languages
;;       'org-babel-load-languages
;;       '((sh . t)))
(require 'ob-ledger)
(require 'ob-latex)
(require 'ob-shell)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-hide ((t (:foreground "#fdf6e3")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command-style
   (quote
    (("" "%(PDF)%(latex) --output-directoyr=output/ %(file-line-error) %(extraopts) %S%(PDFout)"))))
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e3e7e5003380eba6a2a6c54fd57b43ce001affc7b0b4658424143b28b1889d6f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(ledger-reports
   (quote
    (("BAL" "ledger ")
     ("report" "ledger ")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
 '(org-agenda-files
   (quote
    ("~/Documents/org/plan/work.org" "~/Documents/org/investments.org" "/Users/callum/Documents/org/plan/habits.org" "/Users/callum/Documents/org/plan/plan.org" "~/Documents/org/refile.org")))
 '(package-selected-packages
   (quote
    (dired-subtree android-mode kotlin-mode nova-theme rainbow-delimiters ledger-mode org2jekyll sqlup-mode easy-jekyll yaml-mode wc-mode ruby-end alchemist elixir-mode elixir-yasnippets nov org-bullets toc-org org-protocol-jekyll exec-path-from-shell docker phpunit scala-mode auctex-latexmk dockerfile-mode flycheck writeroom-mode auctex smooth-scroll web-mode php-mode markdown-mode swift-mode solarized-theme magit haskell-mode org-edna))))
