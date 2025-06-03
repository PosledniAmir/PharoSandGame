"
This is a auxilliary grain, that represents the items outside of the PSGMatrix. This prevents the other grains from moving outside the matrix.
"
Class {
	#name : 'PSGBorderGrain',
	#superclass : 'PSGGrain',
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'testing' }
PSGBorderGrain >> canFall [
	^ false
]

{ #category : 'drawing' }
PSGBorderGrain >> drawOn: aCanvas at: aPosition [
	^ self
]

{ #category : 'testing' }
PSGBorderGrain >> isEmpty [
	^ false
]

{ #category : 'actions' }
PSGBorderGrain >> resolve: aNeighbourhood at: aPosition [
	^ PSGResolution item: self at: aPosition.
]
