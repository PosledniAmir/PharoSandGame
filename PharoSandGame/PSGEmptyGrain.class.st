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
   | rectangle |
   rectangle := aPosition corner: (aPosition + PSGGrain size).
   aCanvas setPaint: Color white.
   aCanvas drawShape: rectangle.
]

{ #category : 'testing' }
PSGEmptyGrain >> isEmpty [
	^ true
]

{ #category : 'actions' }
PSGEmptyGrain >> resolve: aNeighbourhood at: aPosition [
	^ PSGResolution item: self at: aPosition
]
