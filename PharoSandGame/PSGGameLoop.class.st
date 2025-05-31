Class {
	#name : 'PSGGameLoop',
	#superclass : 'Object',
	#instVars : [
		'matrix',
		'isMouseDown',
		'mouseLocation',
		'activeQueue',
		'cycle',
		'keyEvent'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGGameLoop >> flipStep [
	| flipped |
	flipped := matrix flip.
	matrix := flipped.
	self recalculateQueue.
]

{ #category : 'initialization' }
PSGGameLoop >> initialize [
	super initialize.
	matrix := PSGMatrix new: 120 @ 120 with: [ PSGEmptyGrain new ].
	isMouseDown := false.
	mouseLocation := -1 @ -1.
	activeQueue := SharedQueue new.
	cycle := PSGRainbowCycle new.
	keyEvent := PSGNoneEvent.
]

{ #category : 'accessing' }
PSGGameLoop >> keyEvent: anEvent [
	keyEvent := anEvent 
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
PSGGameLoop >> recalculateQueue [
	| queue |
	queue := SharedQueue new.
	(matrix allPositions 
		reject: [:item | (matrix at: item) isEmpty ])  
		do: [ :item |
			queue nextPut: item
		].
	activeQueue := queue.
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> rotateLeftStep [
	| flipped |
	flipped := matrix rotateLeft.
	matrix := flipped.
	self recalculateQueue.
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> rotateRightStep [
	| flipped |
	flipped := matrix rotateRight.
	matrix := flipped.
	self recalculateQueue.
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> spawnStep [
	| bottom |
	isMouseDown ifFalse: [ ^ self  ].
	(matrix inBounds: mouseLocation ) ifFalse: [ ^ self ].
	(matrix at: mouseLocation ) isEmpty ifFalse: [ ^ self ].
	bottom := PSGNeighbourhood bottomPosition: mouseLocation.
	(matrix at: bottom or: PSGBorderGrain new) isEmpty ifFalse: [ ^ self ].
	matrix at: mouseLocation put: (PSGColoredGrain new: cycle next).
	activeQueue nextPut: mouseLocation.
	^ self
]

{ #category : 'stepping' }
PSGGameLoop >> step [
	self spawnStep.
	self worldStep.
	keyEvent flip ifTrue: [ self flipStep ].
	keyEvent rotateLeft ifTrue: [ self rotateLeftStep ].
	keyEvent rotateRight ifTrue: [ self rotateRightStep ].
	keyEvent := PSGNoneEvent new.
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> worldStep [
	| nextLocation newQueue |
	newQueue := OrderedCollection new.
	nextLocation := activeQueue nextOrNil.
	[ nextLocation notNil ] whileTrue: [ 
		| resultPosition |
		resultPosition := (self worldStepAt: nextLocation with: matrix).
		resultPosition ifNotNil: [ newQueue addAll: resultPosition ].
		nextLocation := activeQueue nextOrNil.
	].
	activeQueue nextPutAll: newQueue.
]

{ #category : 'accessing' }
PSGGameLoop >> worldStepAt: aPosition with: aMatrix [
	| item neighbourhood result target can |
	item := matrix at: aPosition.
	neighbourhood := matrix neighbourhoodAt: aPosition with: PSGBorderGrain new.
	result := item resolve: neighbourhood at: aPosition.
	target := aMatrix at: result position.
	can := target isEmpty.
	can ifTrue: [ | positions |
		aMatrix at: aPosition put: target.
		aMatrix at: result position put: result item.
		positions := aPosition = result position 
			ifTrue: [ { aPosition } ]
			ifFalse: [ { aPosition . result position } ].
		^ positions reject: [ :each | (aMatrix at: each) isEmpty ]
	].
	result item isEmpty ifFalse: [ 
		^ { result position } 
	].
	^ nil
	
]
