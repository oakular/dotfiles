(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "Libre Caslon Text"
                                           :height 1.4))
(add-hook 'nov-mode-hook 'my-nov-font-setup)
(add-hook 'nov-mode-hook 'variable-pitch-mode)
(add-hook 'nov-mode-hook 'olivetti-mode)
(setq nov-text-width 120)


(provide 'init-epub)
