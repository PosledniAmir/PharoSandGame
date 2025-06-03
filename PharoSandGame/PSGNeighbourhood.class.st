"
This class represents the 3 x 3 neighbourhood of items inside a PSGMatrix.
"
Class {
	#name : 'PSGNeighbourhood',
	#superclass : 'Object',
	#instVars : [
		'values'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> bottomLeftPosition: aPosition [
	^ aPosition + (-1 @ 1)
]

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> bottomPosition: aPosition [
	^ aPosition + (0 @ 1)
]

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> bottomRightPosition: aPosition [
	^ aPosition + (1 @ 1)
]

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> leftPosition: aPosition [
	^ aPosition - (1 @ 0)
]

{ #category : 'instance creation' }
PSGNeighbourhood class >> newFrom: anArray [
	^ self new from: anArray 
]

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> rightPosition: aPosition [
	^ aPosition + (1 @ 0)
]

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> topLeftPosition: aPosition [
	^ aPosition - (1 @ 1)
]

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> topPosition: aPosition [
	^ aPosition - (0 @ 1)
]

{ #category : 'as yet unclassified' }
PSGNeighbourhood class >> topRightPosition: aPosition [
	^ aPosition - (-1 @ 1)
]

{ #category : 'accessing' }
PSGNeighbourhood >> bottom [
	^ values seventh 
]

{ #category : 'accessing' }
PSGNeighbourhood >> bottomLeft [
	^ values sixth 
]

{ #category : 'accessing' }
PSGNeighbourhood >> bottomRight [
	^ values eighth 
]

{ #category : 'instance creation' }
PSGNeighbourhood >> from: anArray [
	values := anArray copyFrom: 1 to: 8
]

{ #category : 'initialization' }
PSGNeighbourhood >> initialize [
	values := Array new: 8.
]

{ #category : 'accessing' }
PSGNeighbourhood >> left [
	^ values fourth
]

{ #category : 'accessing' }
PSGNeighbourhood >> right [
	^ values fifth 
]

{ #category : 'accessing' }
PSGNeighbourhood >> top [
	^ values second
]

{ #category : 'accessing' }
PSGNeighbourhood >> topLeft [
	^ values first
]

{ #category : 'accessing' }
PSGNeighbourhood >> topRight [
	^ values third
]
