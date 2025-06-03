"
This event means that nothing should happen to the matrix.
"
Class {
	#name : 'PSGNoneEvent',
	#superclass : 'PSGEvent',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'transformations' }
PSGNoneEvent >> flip [
	^ false
]

{ #category : 'transformations' }
PSGNoneEvent >> rotateLeft [
	^ false
]

{ #category : 'transformations' }
PSGNoneEvent >> rotateRight [
	^ false
]
