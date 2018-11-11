(require 'projectile)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-switch-project-action #'projectile-dired)
(projectile-register-project-type 'xcode '("*.xcworkspace"))

(projectile-mode +1)
(provide 'init-projectile)
