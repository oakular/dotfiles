(require 'doc-view)
(setq doc-view-resolution 144)
(pdf-tools-install)
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
(add-hook 'pdf-tools-enabled-hook 'pdf-view-fit-height-to-window)
(setq pdf-view-midnight-colors '("#fdf6e3" . "#002b36"))

(provide 'init-pdf)
