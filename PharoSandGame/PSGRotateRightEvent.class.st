"
This event means that we should rotate the matrix clockwise.
"
Class {
	#name : 'PSGRotateRightEvent',
	#superclass : 'PSGEvent',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'transformations' }
PSGRotateRightEvent >> flip [
	^ false
]

{ #category : 'transformations' }
PSGRotateRightEvent >> rotateLeft [
	^ false
]

{ #category : 'transformations' }
PSGRotateRightEvent >> rotateRight [
	^ true
]
