"
This represents an empty space in PSGMatrix.
"
Class {
	#name : 'PSGEmptyGrain',
	#superclass : 'PSGGrain',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'testing' }
PSGEmptyGrain >> canFall [
	^ false
]

{ #category : 'drawing' }
PSGEmptyGrain >> drawOn: aCanvas at: aPosition [
   ^ self
]

{ #category : 'testing' }
PSGEmptyGrain >> isEmpty [
	^ true
]

{ #category : 'actions' }
PSGEmptyGrain >> resolve: aNeighbourhood at: aPosition [
	^ PSGResolution item: self at: aPosition
]
