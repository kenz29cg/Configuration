(setq inhibit-startup-message t)
(setq default-directory "E:/Files/Emacs Documents")

;; hide toolbar
;;
;; https://www.emacswiki.org/emacs/ToolBar#toc1
(tool-bar-mode -1)

;; hide scrollbar
;;
;; https://www.emacswiki.org/emacs/ScrollBar
(scroll-bar-mode -1)

(setq-default TeX-engine 'xetex)

(set-fontset-font "fontset-default" 'han (font-spec :family "DengXian" :size 14))


;; Python Elpy Configuration

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(load-theme 'kaolin-ocean t)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))

;;add python

(setq python-shell-interpreter "E:/Programs/Python/Python310/python.exe")


;;Enable Elpy
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))    

(unless (package-installed-p 'use-package)    
  (package-install 'use-package))

(require 'use-package)                 

(setq use-package-always-ensure t)
(use-package elpy
  :ensure t
  :init
  (elpy-enable))


;;Add line numbers

(global-linum-mode t)


;;Virtual environment

(require 'pyvenv)
(pyvenv-activate "E:/Programs/anaconda3/envs/condaenv")


(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)

(setq lsp-java-java-path "E:/Programs/Java/jdk-19/bin/java.exe")
(setq lsp-java-server-install-dir "E:/Programs/jdt-language-server-1.17.0/")

;;Set tab to be 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;Replace operation case sensitive
(defadvice replace-string (around turn-off-case-fold-search)
  (let ((case-fold-search nil))
    ad-do-it))

(ad-activate 'replace-string)

