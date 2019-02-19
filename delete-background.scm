




(define (script-fu-delBack
    theImage
    theLayer
)

    ;Start an undo group so the process can be undone with one undo
    (gimp-image-undo-group-start theImage)

	
    (gimp-selection-none theImage)
    (gimp-image-select-contiguous-color theImage 0 theLayer 0 0)

	(gimp-layer-add-alpha theLayer)
    
	(gimp-edit-bucket-fill theLayer BUCKET-FILL-BG LAYER-MODE-COLOR-ERASE 100 0 0 0 0)
	
	
	
    ;Finish the undo group for the process
    (gimp-image-undo-group-end theImage)

    ;Ensure the updated image is displayed now
    (gimp-displays-flush)
	;(file-png-save RUN-NONINTERACTIVE theImage theLayer (gimp-image-get-filename theImage) (gimp-image-get-filename theImage) FALSE 9 FALSE FALSE FALSE FALSE FALSE)
	;(let*((fileName (car(gimp-image-get-filename theImage)))))
	  
	(file-png-save-defaults RUN-NONINTERACTIVE theImage theLayer (car(gimp-image-get-filename theImage)) (car(gimp-image-get-filename theImage)))
	;(gimp-quit 1)

)

;Register the script w/ GIMP.
(script-fu-register
        "script-fu-delete-background"       ;func name
        "delete-background"               ;menu label
        "Removes a flat background colour from an image";description
        "Inductiveload"                             ;author
        "GPL"                                       ;copyright notice
        "Des. 2018"                                 ;date created
        ""                                          ;image type that the script works on

          SF-IMAGE    "Image"         0
          SF-DRAWABLE "Layer to convert" 0
)

(script-fu-menu-register "script-fu-delete-background"
    "<Image>/Filters/Enhance")