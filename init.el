(setq make-backup-files nil)
(setq auto-save-default nil)

(load (expand-file-name "~/.roswell/helper.el"))
(defun slime-qlot-exec (directory)
  (interactive (list (read-directory-name "Project directory: ")))
  (slime-start :program "qlot"
               :program-args '("exec" "ros" "-S" "." "run")
               :directory directory
               :name 'qlot
               :env (list (concat "PATH=" (mapconcat 'identity exec-path ":")))))

(setq inferior-lisp-program "sbcl")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/slime"))

(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)
(require 'rust-mode)
