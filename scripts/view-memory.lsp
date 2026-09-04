;; view-memory.lsp - In-session named view memory
;; Commands: VIEWSAVE / VIEWGO
;; Usage: zoom where you like -> VIEWSAVE -> name it -> VIEWGO anytime later
(defun c:VIEWSAVE ( / vn )
  (setq vn (getstring T "\nView name: "))
  (if (/= vn "")
    (command "_.-VIEW" "_S" vn)
  )
  (princ)
)

(defun c:VIEWGO ( / vn )
  (setq vn (getstring T "\nView name: "))
  (if (/= vn "")
    (command "_.-VIEW" vn)
  )
  (princ)
)
