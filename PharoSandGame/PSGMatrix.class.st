"
This class represents the visible matrix, that holds all the grains of sand. It should be square, so the clockwise rotation look nice :) but does not really have to.
"
Class {
	#name : 'PSGMatrix',
	#superclass : 'Object',
	#instVars : [
		'matrix',
		'size'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'instance creation' }
PSGMatrix class >> new: aMatrix [
	^ self new matrix: aMatrix.
]

{ #category : 'instance creation' }
PSGMatrix class >> new: a2DSize with: aBlock [
	^ self new resize: a2DSize with: aBlock
]

{ #category : 'as yet unclassified' }
PSGMatrix >> allPositions [
	^ (1 to: size y) flatCollect: [ :y |
        (1 to: size x) collect: [ :x |
            x @ y
        ]
    ].
]

{ #category : 'accessing' }
PSGMatrix >> at: aPosition [
	| row |
	row := matrix at: aPosition y.
	^ row at: aPosition x.
]

{ #category : 'accessing' }
PSGMatrix >> at: aPosition or: anItem [
	(self inBounds: aPosition)
		ifTrue: [ ^ self at: aPosition ]
		ifFalse: [ ^ anItem ]
]

{ #category : 'accessing' }
PSGMatrix >> at: aPosition put: aGrain [
	| row |
	row := matrix at: aPosition y.
	row at: aPosition x put: aGrain.
	^ self
]

{ #category : 'drawing' }
PSGMatrix >> drawOn: aCanvas [
	1 to: size y do: [ :y | 
		1 to: size x do: [ :x |
			| item |
			item := self at: x @ y.
			item drawOn: aCanvas at: ((x - 1) * PSGGrain size x) @ ((y - 1) * PSGGrain size y) 
		] 
	]
]

{ #category : 'as yet unclassified' }
PSGMatrix >> flip [
	^ self class new: matrix reverse
]

{ #category : 'ensure bounds' }
PSGMatrix >> inBounds: aPosition [
	^ (aPosition x between: 1 and: size x) and: [ 
		aPosition y between: 1 and: size y ]
]

{ #category : 'initialization' }
PSGMatrix >> initialize [
	super initialize.
	matrix := Array new: 0 withAll: nil.
	size := 0 @ 0.
]

{ #category : 'accessing' }
PSGMatrix >> matrix: aMatrix [
	matrix := aMatrix.
	size := matrix isEmpty 
		ifTrue: [ 0 @ 0 ]
		ifFalse: [ matrix first size @ matrix size ]
	
]

{ #category : 'accessing' }
PSGMatrix >> neighbourhoodAt: aPosition with: anItem [
	^ PSGNeighbourhood newFrom:{
		self at: aPosition - (1 @ 1) or: anItem.
		self at: aPosition - (0 @ 1) or: anItem.
		self at: aPosition - (-1 @ 1) or: anItem.
		self at: aPosition - (1 @ 0) or: anItem.
		self at: aPosition + (1 @ 0) or: anItem.
		self at: aPosition + (-1 @ 1) or: anItem.
		self at: aPosition + (0 @ 1) or: anItem.
		self at: aPosition + (1 @ 1) or: anItem.
	}
]

{ #category : 'initialization' }
PSGMatrix >> resize: a2DSize with: aBlock [
    size := a2DSize.
    matrix := (1 to: size y) collect: [ :y |
        (1 to: size x) collect: [ :x |
            aBlock value
        ]
    ].
]

{ #category : 'as yet unclassified' }
PSGMatrix >> rotateLeft [
	| result |
    result := (size x to: 1 by: -1) collect: [ :x |
        (1 to: size y) collect: [ :y |
            self at: x @ y
        ]
    ].
   size := size y @ size x.
	matrix := result
]

{ #category : 'as yet unclassified' }
PSGMatrix >> rotateRight [
	| result |
    result := (1 to: size x) collect: [ :x |
        (size y to: 1 by: -1) collect: [ :y |
            self at: x @ y
        ]
    ].
   size := size y @ size x.
	matrix := result
]

{ #category : 'accessing' }
PSGMatrix >> size [
	^ size
]
