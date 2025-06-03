"
Basic black sand grain.
"
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

{ #category : 'private' }
PSGSandGrain >> moveBottom: aPosition [
	| bottom |
	bottom := PSGNeighbourhood bottomPosition: aPosition.
	^ PSGResolution item: self at: bottom 
]

{ #category : 'private' }
PSGSandGrain >> moveBottomLeft: aPosition [
	| bottomLeft |
	bottomLeft := PSGNeighbourhood bottomLeftPosition: aPosition. 
	^ PSGResolution item: self at: bottomLeft 
]

{ #category : 'private' }
PSGSandGrain >> moveBottomLeftOrRight: aPosition [
	| left |
	left := { true . false } atRandom.
	left ifTrue: [ ^ self moveBottomLeft: aPosition ].
	^ self moveBottomRight: aPosition
]

{ #category : 'private' }
PSGSandGrain >> moveBottomRight: aPosition [
	| bottomRight |
	bottomRight := PSGNeighbourhood bottomRightPosition: aPosition.
	^ PSGResolution item: self at: bottomRight 
]

{ #category : 'actions' }
PSGSandGrain >> resolve: aNeighbourhood at: aPosition [
	| canLeft canRight |
	aNeighbourhood bottom isEmpty ifTrue: [ ^ self moveBottom: aPosition ].
	canLeft := aNeighbourhood bottomLeft isEmpty.
	canRight := aNeighbourhood bottomRight isEmpty.
	(canLeft and: [ canRight ]) ifTrue: [ ^ self moveBottomLeftOrRight: aPosition ].
	canLeft ifTrue: [ ^ self moveBottomLeft: aPosition ].
	canRight ifTrue: [ ^ self moveBottomRight: aPosition ].
	^ PSGResolution item: self at: aPosition
]
