"
Colored grain, the hue of the color represents in some sense its falling speed.
"
Class {
	#name : 'PSGColoredGrain',
	#superclass : 'PSGSandGrain',
	#instVars : [
		'color'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'instance creation' }
PSGColoredGrain class >> new: aColor [
	^ self new color: aColor
]

{ #category : 'accessing' }
PSGColoredGrain >> color: aColor [
	color := aColor
]

{ #category : 'drawing' }
PSGColoredGrain >> drawOn: aCanvas at: aPosition [
	| rectangle |
	rectangle := aPosition corner: (aPosition + PSGGrain size).
	aCanvas setPaint: color.
	aCanvas drawShape: rectangle
]

{ #category : 'initialization' }
PSGColoredGrain >> initialize [
	super initialize.
	color := Color black.
]

{ #category : 'private' }
PSGColoredGrain >> moveBottom: aPosition [
	| bottom |
	bottom := PSGNeighbourhood bottomPosition: aPosition.
	^ PSGResolution item: self at: bottom 
]

{ #category : 'private' }
PSGColoredGrain >> moveBottomLeft: aPosition [
	| bottomLeft |
	bottomLeft := PSGNeighbourhood bottomLeftPosition: aPosition. 
	^ PSGResolution item: self at: bottomLeft 
]

{ #category : 'private' }
PSGColoredGrain >> moveBottomLeftOrRight: aPosition [
	| left |
	left := { true . false } atRandom.
	left ifTrue: [ ^ self moveBottomLeft: aPosition ].
	^ self moveBottomRight: aPosition
]

{ #category : 'private' }
PSGColoredGrain >> moveBottomRight: aPosition [
	| bottomRight |
	bottomRight := PSGNeighbourhood bottomRightPosition: aPosition.
	^ PSGResolution item: self at: bottomRight 
]

{ #category : 'actions' }
PSGColoredGrain >> resolve: aNeighbourhood at: aPosition [
	| canLeft canRight canBottom shouldMove |
	shouldMove := self shouldMove.
	canBottom := shouldMove and: [ aNeighbourhood bottom isEmpty ].
	canLeft := shouldMove and: [ aNeighbourhood bottomLeft isEmpty ].
	canRight := shouldMove and: [ aNeighbourhood bottomRight isEmpty ].
	canBottom ifTrue: [ ^ self moveBottom: aPosition ].
	(canLeft and: [ canRight ]) ifTrue: [ ^ self moveBottomLeftOrRight: aPosition ].
	canLeft ifTrue: [ ^ self moveBottomLeft: aPosition ].
	canRight ifTrue: [ ^ self moveBottomRight: aPosition ].
	^ PSGResolution item: self at: aPosition
]

{ #category : 'asserting' }
PSGColoredGrain >> shouldMove [
	^ 36 atRandom <= ((color hue / 10) + 1)
]

{ #category : 'sorting' }
PSGColoredGrain >> sortKey [
	^ color hue
]
