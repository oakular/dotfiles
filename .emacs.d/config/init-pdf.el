(require 'doc-view)
(pdf-tools-install)
;; (add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
(add-hook 'pdf-tools-enabled-hook 'pdf-view-fit-height-to-window)
(add-hook 'pdf-tools-enabled-hook 'pdf-outline-follow-mode)
(setq pdf-view-midnight-colors '("#fdf6e3" . "#002b36"))

(provide 'init-pdf)
