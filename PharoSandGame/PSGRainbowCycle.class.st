"
This class represents a state automaton that receives a color on message next and then it chooses the next color. It is basically an infinite iterator.
"
Class {
	#name : 'PSGRainbowCycle',
	#superclass : 'Object',
	#instVars : [
		'hue',
		'saturation',
		'brightness',
		'step'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'initialization' }
PSGRainbowCycle >> initialize [
	super initialize.
	hue := 0.0.
	saturation := 1.0.
	brightness := 0.9.
	step := 1
]

{ #category : 'accessing' }
PSGRainbowCycle >> next [
	| color |
	color := Color h: hue s: saturation v: brightness.
	hue := hue + step.
	hue > 360.0 ifTrue: [ hue := hue - 360.0 ].
	^ color
]
