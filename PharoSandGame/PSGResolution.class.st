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

{ #category : 'as yet unclassified' }
PSGResolution >> item: anItem at: aPosition [
	item := anItem.
	position := aPosition.
	^ self
]

{ #category : 'accessing' }
PSGResolution >> position [
	^ position
]
