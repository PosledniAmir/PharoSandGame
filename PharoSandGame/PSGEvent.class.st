Class {
	#name : 'PSGEvent',
	#superclass : 'Object',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGEvent >> flip [
	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PSGEvent >> rotateLeft [
	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PSGEvent >> rotateRight [
	^ self subclassResponsibility 
]
