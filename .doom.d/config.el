;;; $Doomdir/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Rafael Corsi"
      user-mail-address "corsiferrao@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two
 (setq doom-font (font-spec :family "Dank Mono" :size 30)
       doom-variable-pitch-font (font-spec :family "sans" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq ispell-dictionary "pt_BR")
;  ;; ispell-set-spellchecker-params has to be called
;  ;; before ispell-hunspell-add-multi-dic will work
(ispell-set-spellchecker-params)
;  (ispell-hunspell-add-multi-dic "pt_BR,en_US")

(windmove-default-keybindings)

(defun remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "" nil t))))
;(global-set-key [f8] 'remove-newlines-in-region)

(setq doom-modeline-height 1)
(set-face-attribute 'mode-line nil :height 50)
(set-face-attribute 'mode-line-inactive nil :height 50)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . typescript-mode))

(setf (alist-get 'markdown-mode +spell-excluded-faces-alist)
      '(markdown-code-face
        markdown-reference-face
        markdown-link-face
        markdown-url-face
        markdown-markup-face
        markdown-html-attr-value-face
        markdown-html-attr-name-face
        markdown-html-tag-name-face))

(setq display-line-numbers-type 'relative)


(setq org-roam-directory (file-truename "~/org-roam"))
(org-roam-db-autosync-mode)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'after-init-hook 'global-company-mode)

(setq default-input-method "portuguese-prefix")

(setq! bibtex-completion-bibliography '("~/Artigos/library.bib"))
(setq! citar-bibliography '("~/Artigos/library.bib"))

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.33)
               (window-parameters . ((no-other-window . t)
                                     (no-delete-other-windows . t)))))

(setq consult-notes-sources
      '(("Org"             ?o "~/org-roam")))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
