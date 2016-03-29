; iconv -f cp1251 file1 > file2



; Add repo packege
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)			; Initial pkg

(load-theme 'wombat t)			; Themes

(desktop-save-mode  t)			; Save desktop
(tool-bar-mode     -1)			; Disable tool-bar
(tooltip-mode      -1)			; Disable scroll-bar
(scroll-bar-mode   -1)			; Disable menu
;(menu-bar-mode     -1)
(setq redisplay-dont-pause t)

; Rust mode
(add-to-list 'load-path "/path/to/rust-mode/")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq frame-title-format "Linux Emacs...")

; Trim yes-no
(fset 'yes-or-no-p 'y-or-n-p)

;Scrolling settings
(setq auto-fill-mode -1)
(setq scroll-step 1)
(setq scroll-conservatively 100000)      ; не прыгать на середину страницы при скроллинге
(setq scroll-margin 5)                   ; начинать промотку страницы за 5 сток до края
(global-hl-line-mode 0)
(setq scroll-preserve-screen-position t) ; без этого не будет нормально работать страница вниз/вверх


; Number string
(require 'linum)
(line-number-mode t)
(global-linum-mode t)
(column-number-mode t)
(setq linum-format " %d")

; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             t)
(setq font-lock-maximum-decoration t)


;; Indent settings
(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter
                                                 ;; перевести каретку
                                                 ;; и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)


; Delete selection
(delete-selection-mode t)


; Fringe settings
(fringe-mode '(8 . 0)) ;; органичиталь текста только слева
(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева


; Key binding
(global-set-key (kbd "C-c") 'kill-ring-save)       ; Копирование
(global-set-key (kbd "C-v") 'yank)                 ; Вставка
(global-set-key (kbd "C-w") 'kill-region)          ; Вырезать
(global-set-key (kbd "C-z") 'undo)                 ; Вернуть
(global-set-key (kbd"\C-x\C-b") 'buffer-menu)      ; Переопределение буфера меню

(provide 'init-key-bindings)




;; System type
(if (eq system-type 'windows-nt)
    (progn
        ;(setq frame-title-format "Windows Emacs: %f")
      
        (prefer-coding-system                   'windows-1251)
        (set-terminal-coding-system             'windows-1251)
        (set-keyboard-coding-system        'windows-1251-unix)
        (set-selection-coding-system            'windows-1251)
        (setq file-name-coding-system           'windows-1251)
        (setq-default coding-system-for-read    'windows-1251)
        (setq default-buffer-file-coding-system 'windows-1251)

    )
    (progn
        ;(setq frame-title-format "Linux Emacs: %f")

        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system        'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8)

        (set-default-font "Input Mono Narrow Semi-Condensed 10")  ; Set font
    )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(scroll-step 3))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
