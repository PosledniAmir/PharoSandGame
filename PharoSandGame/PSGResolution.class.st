"
This class basically represents a named pair. This pair is a result of a resolution between 2 grains, it contains the item that should be put to a position in the PSGMatrix.
"
Class {
	#name : 'PSGResolution',
	#superclass : 'Object',
	#instVars : [
		'item',
		'position'
	],
	#category : 'PharoSandGame',
	#package : 'PharoSandGame'
}

{ #category : 'as yet unclassified' }
PSGResolution class >> item: anItem at: aPosition [
	^ self new item: anItem at: aPosition
]

{ #category : 'initialization' }
PSGResolution >> initialize [
	super initialize.
	item := nil.
	position := 0.
]

{ #category : 'accessing' }
PSGResolution >> item [
	^ item
]

{ #category : 'accessing' }
PSGResolution >> item: anItem at: aPosition [
	item := anItem.
	position := aPosition.
	^ self
]

{ #category : 'accessing' }
PSGResolution >> position [
	^ position
]
