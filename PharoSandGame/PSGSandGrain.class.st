Class {
	#name : 'PSGSandGrain',
	#superclass : 'PSGGrain',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'testing' }
PSGSandGrain >> canFall [
	^ true
]

{ #category : 'drawing' }
PSGSandGrain >> drawOn: aCanvas at: aPosition [
   | rectangle |
   rectangle := aPosition corner: (aPosition + PSGGrain size).
   aCanvas setPaint: Color black.
   aCanvas drawShape: rectangle.
]

{ #category : 'testing' }
PSGSandGrain >> isEmpty [
	^ false
]

{ #category : 'resolving' }
PSGSandGrain >> resolve: aNeighbourhood [
	aNeighbourhood bottom isEmpty ifTrue: [ ^ aNeighbourhood bottom ].
	^ self 
]
