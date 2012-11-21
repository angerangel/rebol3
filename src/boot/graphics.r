REBOL [
	Title: "REBOL Graphics"
	Name: graphics
	Type: extension
	Exports: [] ; added by make-host-ext.r
	; Run make-host-ext.r to convert to host-ext-graphics.h
]

words: [
	;gui-metric
	border-fixed
	border-size
	screen-size
	title-size
	window-min-size
	work-origin
	work-size
	restore
	minimize
	maximize
	activate
]

;temp hack - will be removed later
init-words: command [
	words [block!]
]

init-words words

init: command [
	"Initialize graphics subsystem."
	gob [gob!] "The screen gob (root gob)"
]

caret-to-offset: command [
	"Returns the xy offset (pair) for a specific string position in a graphics object."
	gob [gob!]
	element [integer! block!] "The position of the string in the richtext block"
	position [integer! string!] "The position within the string"
]

cursor: command [
	"Changes the mouse cursor image."
	image [integer! image! none!]
]

offset-to-caret: command [ ;returns pair! instead of the block..needs to be fixed
	"Returns the richtext block at the string position for an XY offset in the graphics object."
	gob [gob!]
	position [pair!]
]

show: command [
	"Display or update a graphical object or block of them."
	gob [gob! none!]
	/window
		state [word!] "Sets the specified window GOB's show state. Keywords: RESTORE, MINIMIZE, MAXIMIZE, ACTIVATE."
]

size-text: command [
	"Returns the size of text rendered by a graphics object."
	gob [gob!]
]

draw: command [
	"Renders draw dialect (scalable vector graphics) to an image (returned)."
	image [image! pair!] "Image or size of image"
	commands [block!] "Draw commands"
]

gui-metric: command [
	"Returns specific gui related metric setting."
	keyword [word!] "Available keywords: BORDER-FIXED, BORDER-SIZE, SCREEN-SIZE, TITLE-SIZE, WINDOW-MIN-SIZE, WORK-ORIGIN and WORK-SIZE."
]

;#not-yet-used [
;
;effect: command [
;	"Renders effect dialect to an image (returned)."
;	image [image! pair!] "Image or size of image"
;	commands [block!] "Effect commands"
;]
;
;]