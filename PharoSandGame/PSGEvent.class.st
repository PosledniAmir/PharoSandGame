"
This class represents matrix transformation events for our Pharo Sand Game.
There are these events:
* PSGFlipEvent - turn matrix upside down.
* PSGRotateLeftEvent - turn matrix counterclockwise.
* PSGRotateRightEvent - turn matrix clockwise.
"
Class {
	#name : 'PSGEvent',
	#superclass : 'Object',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'transformations' }
PSGEvent >> flip [
	^ self subclassResponsibility 
]

{ #category : 'transformations' }
PSGEvent >> rotateLeft [
	^ self subclassResponsibility 
]

{ #category : 'transformations' }
PSGEvent >> rotateRight [
	^ self subclassResponsibility 
]
