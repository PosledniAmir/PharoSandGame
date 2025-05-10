Class {
	#name : 'PSGWindow',
	#superclass : 'SystemWindow',
	#instVars : [
		'process',
		'gameLoop',
		'drawLoop'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'initialization' }
PSGWindow >> initialize [
	super initialize.
	self setLabel: 'Sand Game'.
	self extent: 840@640.
	drawLoop := PSGDrawLoop new.
	self addMorph: drawLoop morph.
]
