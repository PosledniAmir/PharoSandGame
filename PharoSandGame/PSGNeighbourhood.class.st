Class {
	#name : 'PSGNeighbourhood',
	#superclass : 'Object',
	#instVars : [
		'values'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'instance creation' }
PSGNeighbourhood class >> newFrom: anArray [
	^ self new from: anArray 
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
