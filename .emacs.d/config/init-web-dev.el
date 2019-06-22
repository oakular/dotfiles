(setq web-mode-enable-current-element-highlight t)
(add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
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

(add-hook 'php-mode-hook
          '(lambda ()
             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev) company-capf company-files)))
          )

(add-hook 'php-mode-hook 'company-mode)
(add-hook 'php-mode-hook 'display-line-numbers-mode)
(add-hook 'php-mode-hook 'flycheck-mode)

(require 'dumb-jump)
(define-key php-mode-map (kbd "M-g o") 'dumb-jump-go-other-window)
(define-key php-mode-map (kbd "M-g j") 'dumb-jump-go)
(define-key php-mode-map (kbd "M-g x") 'dumb-jump-go-prompt)
(define-key php-mode-map (kbd "M-g z") 'dumb-jump-go-prefer-external-other-window)
(setq dumb-jump-selector 'ivy)

(provide 'flycheck-web-mode-php)

(provide 'init-web-dev)
