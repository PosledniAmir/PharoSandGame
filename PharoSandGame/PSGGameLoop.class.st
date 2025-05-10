Class {
	#name : 'PSGGameLoop',
	#superclass : 'Object',
	#instVars : [
		'queue',
		'matrix'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'initialization' }
PSGGameLoop >> initialize [
	super initialize.
	queue := SharedQueue new.
	matrix := PSGMatrix new: 80 @ 60 with: [ PSGEmptyGrain new ].
]
