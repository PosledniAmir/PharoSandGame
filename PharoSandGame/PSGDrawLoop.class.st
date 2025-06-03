"
This class represents the draw loop, it contains two members:
* morph - useful if we want to put our drawing into a window.
* surface - a cairo surface used for drawing.

The main message we are interested is draw: which accepts a `PSGMatrix` class.
"
Class {
	#name : 'PSGDrawLoop',
	#superclass : 'Object',
	#instVars : [
		'morph',
		'surface'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'drawing - general' }
PSGDrawLoop >> draw: aMatrix [
"accepts a PSGMatrix and draws it on the surface"
	self drawBackground.
	surface drawDuring: [ :canvas |
		 aMatrix drawOn: canvas ].
	surface flush.
	morph form: surface asForm.
	morph changed.
]

{ #category : 'as yet unclassified' }
PSGDrawLoop >> drawBackground [	
	surface drawDuring: [ :canvas |
		canvas 
			setPaint: (Color fromHexString: '#282828'); 
			drawShape: (0@0 corner: surface extent) ].
	surface flush.
]

{ #category : 'initialization' }
PSGDrawLoop >> initialize [
	super initialize.
	surface := AthensCairoSurface extent: 600@600.
	morph := ImageMorph new.
	morph form: surface asForm.
	morph position: 10@30.
	morph extent: 610@640.
]

{ #category : 'accessing' }
PSGDrawLoop >> morph [
	^ morph
]

{ #category : 'accessing' }
PSGDrawLoop >> position [
	^ morph position
]
