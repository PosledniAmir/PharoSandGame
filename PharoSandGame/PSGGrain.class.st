Class {
	#name : 'PSGGrain',
	#superclass : 'Object',
	#classVars : [
		'Size'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'accessing' }
PSGGrain class >> size [
	Size ifNil: [ Size := 10@10 ].
	^ Size
]

{ #category : 'drawing' }
PSGGrain >> drawOn: aCanvas at: aPosition [
	^ self subclassResponsibility 
]

{ #category : 'resolving' }
PSGGrain >> resolve: aNeighbourhood [
	^ self subclassResponsibility 
]
