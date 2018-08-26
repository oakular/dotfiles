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

(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))
(require 'init-dired)
(require 'init-esh)
(require 'init-git)
(require 'init-ledger)
(require 'init-org)

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

;; ----- EDITING -----
(setq-default major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq visible-bell t)
(setq-default fill-column 80)
(show-paren-mode 1)
(setenv "DICTIONARY" "en_GB")
(global-auto-revert-mode t)

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
(setq initial-frame-alist '((top . 0) (left . 0) (width . 120) (height . 70)))
(set-face-attribute 'default nil :height 110)
(set-face-attribute 'default t :font "Hack" )

;; (setq solarized-use-variable-pitch nil
;;       solarized-scale-org-headlines nil)
;; (setq solarized-high-contrast-mode-line t)
;; (setq solarized-distinct-fringe-background t)
;; (load-theme 'solarized-light t)         

(load-theme 'gruvbox-dark-soft t)

;; ----- KEYBOARD & MOUSE CONFIG -----
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
;; Make mouse wheel / trackpad scrolling less jerky
  ;; (setq mouse-wheel-scroll-amount '(1
  ;;                                   ((shift) . 5)
  ;;                                   ((control))))

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

;; ----- WEB DEV CONFIG -----
;; ----- PHP CONFIG -----
(setq web-mode-enable-current-element-highlight t)
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
(setq markdown-header-face "Georgia")
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
    ("35b000995eb4a526249078664d91b056feab7e96e81b2f226a0d9cad7f0a416e" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "62c81ae32320ceff5228edceeaa6895c029cc8f43c8c98a023f91b5b339d633f" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" "c856158cc996d52e2f48190b02f6b6f26b7a9abd5fea0c6ffca6740a1003b333" "7d2e7a9a7944fbde74be3e133fc607f59fdbbab798d13bd7a05e38d35ce0db8d" "ef98b560dcbd6af86fbe7fd15d56454f3e6046a3a0abd25314cfaaefd3744a9e" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e3e7e5003380eba6a2a6c54fd57b43ce001affc7b0b4658424143b28b1889d6f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 
 '(org-agenda-files
   (quote
    ("~/Documents/org/plan/work.org" "~/Documents/org/investments.org" "/Users/callum/Documents/org/plan/habits.org" "/Users/callum/Documents/org/plan/plan.org" "~/Documents/org/refile.org")))
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.75 :html-foreground "Black" :html-background "Transparent" :html-scale 1.75 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(package-selected-packages
   (quote
    (browse-kill-ring mellow-theme ample-theme gruvbox-theme engine-mode dired-subtree android-mode kotlin-mode nova-theme rainbow-delimiters ledger-mode org2jekyll sqlup-mode easy-jekyll yaml-mode wc-mode ruby-end alchemist elixir-mode elixir-yasnippets nov org-bullets toc-org org-protocol-jekyll exec-path-from-shell docker phpunit scala-mode auctex-latexmk dockerfile-mode flycheck writeroom-mode auctex smooth-scroll web-mode php-mode markdown-mode swift-mode solarized-theme magit haskell-mode org-edna))))
(put 'erase-buffer 'disabled nil)
