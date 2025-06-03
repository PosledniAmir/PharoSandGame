"
This event means we should rotate the matrix counterclockwise.
"
Class {
	#name : 'PSGRotateLeftEvent',
	#superclass : 'PSGEvent',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'transformations' }
PSGRotateLeftEvent >> flip [
	^ false
]

{ #category : 'transformations' }
PSGRotateLeftEvent >> rotateLeft [
	^ true
]

{ #category : 'transformations' }
PSGRotateLeftEvent >> rotateRight [
	^ false
]
