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

(require 'init-company)
(require 'init-dired)
(require 'init-docker)
(require 'init-frame)
(require 'init-flycheck)
(require 'init-git)
(require 'init-ledger)
(require 'init-ivy)
(require 'init-org)
(require 'init-esh)
(require 'init-engine)
(require 'init-epub)
(require 'init-pdf)
(require 'init-projectile)
(require 'init-smartparens)
(require 'init-sdev)
(require 'init-sql)
(require 'init-swift)
(require 'init-web-dev)
(require 'init-web)

;; ----- STARTUP -----
(setq default-directory "~/Documents/")
(setq initial-buffer-choice (lambda () (get-buffer-create "**")))

;; ----- EDITING -----
(setq-default major-mode 'text-mode)
(setq-default indent-tabs-mode nil)
(setq visible-bell t)
(setq-default fill-column 80)
(show-paren-mode 1)
(setenv "DICTIONARY" "en_GB")
(global-auto-revert-mode t)
(save-place-mode 1)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "M-z") 'zap-up-to-char)
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)
;; (ido-vertical-mode 1)


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
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook (lambda ()
                             (TeX-fold-mode 1)))
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
(put 'LaTeX-narrow-to-environment 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq custom-file "~/.emacs.d/customisation.el")
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-page 'disabled nil)
