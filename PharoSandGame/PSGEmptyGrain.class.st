Class {
	#name : 'PSGEmptyGrain',
	#superclass : 'PSGGrain',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'drawing' }
PSGEmptyGrain >> drawOn: aCanvas at: aPosition [
   | rectangle paint  path |
   rectangle := aPosition corner: PSGGrain size. 
   paint := aCanvas setStrokePaint: Color black.
	paint width: 2.
   path := aCanvas createRectanglePath: rectangle.
	aCanvas drawShape: path.
]
