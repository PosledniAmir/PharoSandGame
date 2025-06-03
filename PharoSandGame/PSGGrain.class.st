"
This class represents different kinds of grains, we currently use PSGColoredGrain PSGEmptyGrain and PSGBorderGrain.
"
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

{ #category : 'actions' }
PSGGrain >> resolve: aNeighbourood at: aPosition [
	^ self subclassResponsibility 
]
