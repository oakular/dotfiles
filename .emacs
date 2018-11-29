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

;; ---- ALTERING $PATH -----
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'init-dired)
(require 'init-frame)
(require 'init-git)
(require 'init-ledger)
(require 'init-org)
(require 'init-esh)
(require 'init-elfeed)
(require 'init-engine)
(require 'init-epub)
(require 'init-pdf)
(require 'init-projectile)
(require 'init-sdev)
(require 'init-sql)
(require 'init-swift)
(require 'init-web-dev)
(require 'init-web)

;; ----- STARTUP -----
(setq default-directory "~/Documents/")
(setq initial-buffer-choice "~/Documents/personal/mantra.org")

;; ----- EDITING -----
(setq-default major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq visible-bell t)
(setq-default fill-column 80)
(show-paren-mode 1)
(setenv "DICTIONARY" "en_GB")
(global-auto-revert-mode t)

;; ----- KEYBOARD & MOUSE CONFIG -----
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
;; Make mouse wheel / trackpad scrolling less jerky
  ;; (setq mouse-wheel-scroll-amount '(1
  ;;                                   ((shift) . 5)
  ;;                                   ((control))))

;; ----- IDE FUNCTIONALITY -----
(require 'yasnippet)
(yas-global-mode 1)
(require 'company)
(setq company-idle-delay 0.01)

;; colourise compilation buffers
(require 'ansi-color)
(defun my/ansi-colorize-buffer ()
  (let ((buffer-read-only nil))
    (ansi-color-apply-on-region (point-min) (point-max))))
(add-hook 'compilation-filter-hook 'my/ansi-colorize-buffer)

;; ----- LaTeX CONFIG -----
(setq bibtex-dialect 'biblatex)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ledger-font-payee-uncleared-face ((t (:foreground "#dc322f" :height 1.2))))
 '(ledger-font-posting-date-face ((t (:inherit font-lock-keyword-face :height 1.2))))
 '(org-code ((t (:foreground "#586e75" :family "Overpass Mono"))))
 '(org-default ((t (:family "Overpass Mono"))))
 '(org-document-title ((t (:foreground "#93a1a1" :weight bold :height 1.3 :family "Libre Caslon Text"))))
 '(org-hide ((t :foreground "#3C4C55")))
 '(org-level-1 ((t (:inherit variable-pitch :foreground "#cb4b16"))))
 '(variable-pitch ((t (:family "Overpass")))))
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
    ("fd3c7bd752f48dcb7efa5f852ef858c425b1c397b73851ff8816c0580eab92f1" "3da031b25828b115c6b50bb92a117f5c0bbd3d9d0e9ba5af3cd2cb9db80db1c2" "595617a3c537447aa7e76ce05c8d43146a995296ea083211225e7efc069c598f" "ba913d12adb68e9dadf1f43e6afa8e46c4822bb96a289d5bf1204344064f041e" "35b000995eb4a526249078664d91b056feab7e96e81b2f226a0d9cad7f0a416e" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "62c81ae32320ceff5228edceeaa6895c029cc8f43c8c98a023f91b5b339d633f" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" "c856158cc996d52e2f48190b02f6b6f26b7a9abd5fea0c6ffca6740a1003b333" "7d2e7a9a7944fbde74be3e133fc607f59fdbbab798d13bd7a05e38d35ce0db8d" "ef98b560dcbd6af86fbe7fd15d56454f3e6046a3a0abd25314cfaaefd3744a9e" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e3e7e5003380eba6a2a6c54fd57b43ce001affc7b0b4658424143b28b1889d6f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(ledger-reports
   (quote
    (("exp_excl_housing" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal expenses and not housing:rent -b 2018/10/29 -e 2018/11/29")
     ("expenses" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal expenses -b 2018/10/29 -e 2018/11/29")
     ("income" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal income and not parents:rent -b 2018/09/29 --invert")
     ("capital" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal assets:capital")
     ("assets" "ledger [[ledger-mode-flags]] -f /Users/callum/Documents/personal/finance/ledger/journal.ledger bal assets")
     ("BAL" "ledger ")
     ("report" "ledger ")
     ("bal" "%(binary) -f %(ledger-file) bal")
     ("reg" "%(binary) -f %(ledger-file) reg")
     ("payee" "%(binary) -f %(ledger-file) reg @%(payee)")
     ("account" "%(binary) -f %(ledger-file) reg %(account)"))))
 '(ns-auto-titlebar-mode t nil (ns-auto-titlebar))
 '(org-agenda-files
   (quote
    ("~/Documents/org/plan/work.org" "~/Documents/org/investments.org" "/Users/callum/Documents/org/plan/plan.org" "~/Documents/org/refile.org")))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.75 :html-foreground "Black" :html-background "Transparent" :html-scale 1.75 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(package-selected-packages
   (quote
    (theme-changer constant-theme olivetti golden-ratio projectile flycheck-xcode ns-auto-titlebar company-sourcekit pdf-tools org-kanban plantuml-mode stock-ticker yasnippet-snippets flycheck-swift ob-swift elfeed-org elfeed browse-kill-ring mellow-theme ample-theme gruvbox-theme engine-mode dired-subtree android-mode kotlin-mode nova-theme rainbow-delimiters ledger-mode org2jekyll sqlup-mode easy-jekyll yaml-mode wc-mode ruby-end alchemist elixir-mode elixir-yasnippets nov org-bullets toc-org org-protocol-jekyll exec-path-from-shell docker phpunit scala-mode auctex-latexmk dockerfile-mode flycheck auctex smooth-scroll web-mode php-mode markdown-mode swift-mode solarized-theme magit haskell-mode org-edna)))
 '(safe-local-variable-values
   (quote
    ((projectile-project-test-cmd . "fastlane tests")
     (projectile-project-name . "comp39x-code")
     (projectile-project-compilation-cmd . "fastlane build"))))
 '(solarized-use-variable-pitch t))
(put 'erase-buffer 'disabled nil)
