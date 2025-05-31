Class {
	#name : 'PSGFlipEvent',
	#superclass : 'PSGEvent',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGFlipEvent >> flip [
	^ true
]

{ #category : 'as yet unclassified' }
PSGFlipEvent >> rotateLeft [ 
	^ false
]

{ #category : 'as yet unclassified' }
PSGFlipEvent >> rotateRight [
	^ false
]
