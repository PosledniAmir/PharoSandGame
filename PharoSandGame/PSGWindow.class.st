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
	self extent: 810@640.
	gameLoop := PSGGameLoop new.
	drawLoop := PSGDrawLoop new.
	self addMorph: drawLoop morph.
	drawLoop draw: gameLoop matrix.
]
