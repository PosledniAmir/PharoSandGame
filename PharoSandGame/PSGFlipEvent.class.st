"
This represents an event that should flip matrix upside down.
"
Class {
	#name : 'PSGFlipEvent',
	#superclass : 'PSGEvent',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'transformations' }
PSGFlipEvent >> flip [
	^ true
]

{ #category : 'transformations' }
PSGFlipEvent >> rotateLeft [ 
	^ false
]

{ #category : 'transformations' }
PSGFlipEvent >> rotateRight [
	^ false
]
