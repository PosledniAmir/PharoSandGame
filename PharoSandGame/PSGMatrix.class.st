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
			item drawOn: aCanvas at: (x * PSGGrain size x) @ (y * PSGGrain size y) 
		] 
	]
]

{ #category : 'initialization' }
PSGMatrix >> initialize [
	super initialize.
	matrix := Array new: 0 withAll: nil.
	size := 0 @ 0.
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
