Class {
	#name : 'PSGGameLoop',
	#superclass : 'Object',
	#instVars : [
		'matrix',
		'isMouseDown',
		'mouseLocation',
		'activeQueue'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'initialization' }
PSGGameLoop >> initialize [
	super initialize.
	matrix := PSGMatrix new: 80 @ 60 with: [ PSGEmptyGrain new ].
	isMouseDown := false.
	mouseLocation := -1 @ -1.
	activeQueue := SharedQueue new.
]

{ #category : 'accessing' }
PSGGameLoop >> matrix [
	^ matrix
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> mouseDown [
	isMouseDown := true
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> mouseOver: aPosition [
	| locX locY |
	locX := (aPosition x // PSGGrain size x) + 1.
	locY := (aPosition y // PSGGrain size y) + 1.
	mouseLocation := locX @ locY.
	^ self

]

{ #category : 'as yet unclassified' }
PSGGameLoop >> mouseUp [
	isMouseDown := false.
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> spawnStep [
	| bottom |
	isMouseDown ifFalse: [ ^ self  ].
	(matrix inBounds: mouseLocation ) ifFalse: [ ^ self ].
	(matrix at: mouseLocation ) isEmpty ifFalse: [ ^ self ].
	bottom := PSGNeighbourhood bottomPosition: mouseLocation.
	(matrix at: bottom or: PSGBorderGrain new) isEmpty ifFalse: [ ^ self ].
	matrix at: mouseLocation put: PSGSandGrain new.
	activeQueue nextPut: mouseLocation.
	^ self
]

{ #category : 'stepping' }
PSGGameLoop >> step [
	self spawnStep.
	self worldStep.
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> worldStep [
	| updatedMatrix  nextLocation newQueue |
	newQueue := OrderedCollection new.
	updatedMatrix := PSGMatrix new: matrix size with: [ PSGEmptyGrain new ].
	nextLocation := activeQueue nextOrNil.
	[ nextLocation notNil ] whileTrue: [ 
		| resultPosition |
		resultPosition := (self worldStepAt: nextLocation with: updatedMatrix).
		resultPosition ifNotNil: [ newQueue add: resultPosition ].
		nextLocation := activeQueue nextOrNil.
	].
	activeQueue nextPutAll: newQueue.
	matrix := updatedMatrix.
]

{ #category : 'accessing' }
PSGGameLoop >> worldStepAt: aPosition with: aMatrix [
	| item neighbourhood result |
	item := matrix at: aPosition.
	neighbourhood := matrix neighbourhoodAt: aPosition with: PSGBorderGrain new.
	result := item resolve: neighbourhood at: aPosition.
	result item isEmpty ifFalse: [ 
		aMatrix at: result position put: result item.
		^ result position
	].
	^ nil
	
]
