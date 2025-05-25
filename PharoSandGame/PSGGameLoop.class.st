Class {
	#name : 'PSGGameLoop',
	#superclass : 'Object',
	#instVars : [
		'matrix',
		'isMouseDown',
		'mouseLocation',
		'activeQueue',
		'cycle',
		'flipEvent'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGGameLoop >> flip [
	flipEvent := flipEvent not
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> flipStep [

	| flipped transBlk queue |
	flipped := matrix flip.
	transBlk := [ :position | 
		| x y s |
		s := matrix size y.
		x := position x.
		y := s + 1 - position y.
		x @ y
		].
	matrix := flipped.
	queue := SharedQueue new.
	(matrix allPositions 
		reject: [:item | (matrix at: item) isEmpty ]) 
		do: [ :item |
			queue nextPut: item
		].
	activeQueue := queue.
]

{ #category : 'initialization' }
PSGGameLoop >> initialize [
	super initialize.
	matrix := PSGMatrix new: 160 @ 120 with: [ PSGEmptyGrain new ].
	isMouseDown := false.
	mouseLocation := -1 @ -1.
	activeQueue := SharedQueue new.
	cycle := PSGRainbowCycle new.
	flipEvent := false.
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
	matrix at: mouseLocation put: (PSGColoredGrain new: cycle next).
	activeQueue nextPut: mouseLocation.
	^ self
]

{ #category : 'stepping' }
PSGGameLoop >> step [
	self spawnStep.
	self worldStep.
	flipEvent ifFalse: [ ^ self ].
	self flipStep.
	flipEvent := false.
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
