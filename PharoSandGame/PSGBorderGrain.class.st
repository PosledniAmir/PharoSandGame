Class {
	#name : 'PSGBorderGrain',
	#superclass : 'PSGGrain',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'testing' }
PSGBorderGrain >> canFall [
	^ false
]

{ #category : 'drawing' }
PSGBorderGrain >> drawOn: aCanvas at: aPosition [
	^ self
]

{ #category : 'testing' }
PSGBorderGrain >> isEmpty [
	^ false
]

{ #category : 'as yet unclassified' }
PSGBorderGrain >> resolve: aNeighbourhood at: aPosition [
	^ PSGResolution item: self at: aPosition.
]
