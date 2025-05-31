Class {
	#name : 'PSGRotateLeftEvent',
	#superclass : 'PSGEvent',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGRotateLeftEvent >> flip [
	^ false
]

{ #category : 'as yet unclassified' }
PSGRotateLeftEvent >> rotateLeft [
	^ true
]

{ #category : 'as yet unclassified' }
PSGRotateLeftEvent >> rotateRight [
	^ false
]
