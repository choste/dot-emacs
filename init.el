(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; Package setup
(require 'package)
(package-initialize)

(defvar my-packages
  '(magit)
  "List of packages to install on first launch")

(defun my-packages-installed-p ()
  (cl-loop for p in my-packages
	   when (not (package-installed-p p)) do (cl-return nil)
	   finally (cl-return t)))

(unless (my-packages-installed-p)
  (package-refresh-contents)
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

;; Look and feel configurations
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
