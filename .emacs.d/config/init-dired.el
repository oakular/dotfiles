(require 'dired)

(setq dired-listing-switches "-lurh")
(setq dired-async-mode t)
(setq dired-isearch-filenames t)
(setq dired-use-ls-dired nil)
(define-key dired-mode-map  (kbd "i") 'dired-subtree-toggle)
(setq dired-subtree-use-backgrounds nil)

(provide 'init-dired)
