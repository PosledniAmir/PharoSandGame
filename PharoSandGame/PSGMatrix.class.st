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
PSGMatrix class >> new: a2DSize with: aBlock [
	^ self new resize: a2DSize with: aBlock
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

{ #category : 'accessing' }
PSGMatrix >> size [
	^ size
]
