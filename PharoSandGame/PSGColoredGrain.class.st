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
