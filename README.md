# GstarCAD View & Navigation Tools

Small AutoLISP helpers to zoom to the exact objects you select and to save and restore named views during a drafting session.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Working in large drawings means constantly zooming back and forth. These small helpers zoom to the exact objects you select with one command, and let you save the current view under a short name and restore it at any time during the session, no menus and no long view names to remember.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/zoom-select.lsp` | ;; zoom-select.lsp - Zoom to the selected objects
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
 |
| `scripts/view-memory.lsp` | ;; view-memory.lsp - In-session named view memory
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
