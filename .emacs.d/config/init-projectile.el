(require 'projectile)
(require 'docker)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-switch-project-action #'projectile-dired)
(projectile-register-project-type 'xcodew '(".xcodew"))

(projectile-register-project-type 'xcodep '(".xcodep")
                  :compile "fastlane build"
                  :test "fastlane test")

(projectile-register-project-type 'org '("publish.el")
                                  :compile (org-publish "site"))


(defun start-containers (laradock-dir) "Starts the containers for the laradock project"
       (ignore-errors
	 (cd laradock-dir)
	 (docker-compose-start () ()))
       )

(projectile-register-project-type 'laradock '(".env.example")
                                  :compile "composer install"
                                  :test "phpunit"
                                  :test-dir "site/tests/"
                                  :src-dir "site/"

                                  )

(setq projectile-completion-system 'ivy)
(counsel-projectile-mode 1)

(projectile-mode +1)
(provide 'init-projectile)
