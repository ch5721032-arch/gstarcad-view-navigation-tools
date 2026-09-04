;; zoom-select.lsp - Zoom to the selected objects
;; Command: ZOOMSEL
;; Usage: APPLOAD -> ZOOMSEL -> select objects -> Enter
(defun c:ZOOMSEL ( / ss )
  (setq ss (ssget))
  (if ss
    (progn
      (command "_.ZOOM" "_O" ss "")
      (princ "\nZoomed to selection.")
    )
  )
  (princ)
)
