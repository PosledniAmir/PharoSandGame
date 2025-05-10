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
	surface drawDuring: [ :canvas |
		 aMatrix drawOn: canvas ].
	surface flush.
	morph form: surface asForm.
	morph changed.
]

{ #category : 'initialization' }
PSGDrawLoop >> initialize [
	super initialize.
	surface := AthensCairoSurface extent: 800@600.
	morph := ImageMorph new.
	morph form: surface asForm.
	morph position: 20@20.
	morph extent: 800@600.
]

{ #category : 'accessing' }
PSGDrawLoop >> morph [
	^ morph
]
