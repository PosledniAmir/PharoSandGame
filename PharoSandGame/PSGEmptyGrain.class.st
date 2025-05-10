Class {
	#name : 'PSGEmptyGrain',
	#superclass : 'PSGGrain',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

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
