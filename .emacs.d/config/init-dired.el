(require 'dired)

(setq dired-listing-switches "-lurh")
(setq dired-async-mode t)
(setq dired-isearch-filenames t)
(setq dired-use-ls-dired nil)

;; dired subtree org-like keybindings
(define-key dired-mode-map  (kbd "i") 'dired-subtree-cycle)
(define-key dired-mode-map  (kbd "C-c C-p") 'dired-subtree-up)
(define-key dired-mode-map  (kbd "C-c C-n") 'dired-subtree-down)
(define-key dired-mode-map  (kbd "C-c C-f") 'dired-subtree-next-sibling)
(define-key dired-mode-map  (kbd "C-c C-b") 'dired-subtree-previous-sibling)

(setq dired-subtree-use-backgrounds nil)
(setq dired-subtree-cycle-depth 12)
(provide 'init-dired)
