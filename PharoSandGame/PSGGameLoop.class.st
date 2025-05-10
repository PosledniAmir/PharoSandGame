Class {
	#name : 'PSGGameLoop',
	#superclass : 'Object',
	#instVars : [
		'queue',
		'matrix'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'stepping' }
PSGGameLoop >> eventStep [
	| item |
	item := queue nextOrNil.
	item ifNil: [ ^ self ].
	item value.
	^ self
]

{ #category : 'initialization' }
PSGGameLoop >> initialize [
	super initialize.
	queue := SharedQueue new.
	matrix := PSGMatrix new: 80 @ 60 with: [ PSGEmptyGrain new ].
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> leftClick: aPosition [
	| locX locY |
	locX := aPosition x // PSGGrain size x.
	locY := aPosition y // PSGGrain size y.
	(matrix inBounds: locX @ locY) 
		ifFalse: [ ^ self ].
	queue nextPut: [ matrix at: locX @ locY put: PSGSandGrain new ].
	^ self

]

{ #category : 'accessing' }
PSGGameLoop >> matrix [
	^ matrix
]

{ #category : 'stepping' }
PSGGameLoop >> step [
	self eventStep.
	self worldStep.
]

{ #category : 'as yet unclassified' }
PSGGameLoop >> worldStep [
	self notImplemented 
]
