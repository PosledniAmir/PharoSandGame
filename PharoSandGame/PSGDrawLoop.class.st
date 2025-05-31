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
