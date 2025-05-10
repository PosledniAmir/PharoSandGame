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
