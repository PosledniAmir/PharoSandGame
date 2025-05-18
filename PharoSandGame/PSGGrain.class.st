Class {
	#name : 'PSGGrain',
	#superclass : 'Object',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'accessing' }
PSGGrain class >> size [
	^ 5 @ 5
]

{ #category : 'testing' }
PSGGrain >> canFall [
	^ self subclassResponsibility 
]

{ #category : 'drawing' }
PSGGrain >> drawOn: aCanvas at: aPosition [
	^ self subclassResponsibility 
]

{ #category : 'testing' }
PSGGrain >> isEmpty [
	^ self subclassResponsibility 
]

{ #category : 'as yet unclassified' }
PSGGrain >> resolve: aNeighbourood at: aPosition [
	^ self subclassResponsibility 
]
