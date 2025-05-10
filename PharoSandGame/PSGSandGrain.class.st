Class {
	#name : 'PSGSandGrain',
	#superclass : 'PSGGrain',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGSandGrain >> drawOn: aCanvas at: aPosition [
   | rectangle |
   rectangle := aPosition corner: (aPosition + PSGGrain size).
   aCanvas setPaint: Color black.
   aCanvas drawShape: rectangle.
]
