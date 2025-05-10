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
   | rectangle paint  path |
   rectangle := aPosition corner: (aPosition + PSGGrain size).
   aCanvas setPaint: Color white.
   aCanvas drawShape: rectangle.
   paint := aCanvas setStrokePaint: Color black.
	paint width: 2.
   path := aCanvas createRectanglePath: rectangle.
	aCanvas drawShape: path.
]

{ #category : 'testing' }
PSGEmptyGrain >> isEmpty [
	^ true
]

{ #category : 'resolving' }
PSGEmptyGrain >> resolve: aNeighbourhood [
	aNeighbourhood top canFall ifTrue: [ ^ aNeighbourhood top ].
	^ self
]
