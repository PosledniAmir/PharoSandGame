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
