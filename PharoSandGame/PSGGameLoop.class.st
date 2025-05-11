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
	locX := (aPosition x // PSGGrain size x) + 1.
	locY := (aPosition y // PSGGrain size y) + 1.
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
	| updatedMatrix |
	updatedMatrix := PSGMatrix new: matrix size with: [ PSGEmptyGrain new ].
	1 to: matrix size y do: [ :y |
        1 to: matrix size x do: [ :x |
            self worldStepAt: x @ y with: updatedMatrix 
        ]
    ].
	matrix := updatedMatrix.
]

{ #category : 'accessing' }
PSGGameLoop >> worldStepAt: aPosition with: aMatrix [
	| item neighbourhood result |
	item := matrix at: aPosition.
	neighbourhood := matrix neighbourhoodAt: aPosition with: PSGBorderGrain new.
	result := item resolve: neighbourhood at: aPosition.
	result item isEmpty ifFalse: [ aMatrix at: result position put: result item ].
	
]
