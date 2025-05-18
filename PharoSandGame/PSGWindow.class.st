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

{ #category : 'as yet unclassified' }
PSGWindow >> gameLoopProcess [
	^ [ self runGameLoop ] forkAt: Processor userInterruptPriority named: 'Sand Game Loop'
]

{ #category : 'as yet unclassified' }
PSGWindow >> handleClick: anEvent [
	| global local |
	global := anEvent position.
	local := global - drawLoop position.
	gameLoop leftClick: local.
]

{ #category : 'events - processing' }
PSGWindow >> handleKeyDown: anEvent [
	anEvent keyCharacter = Character space ifTrue: [ gameLoop flip ]
]

{ #category : 'as yet unclassified' }
PSGWindow >> handleMouseDown: anEvent [
	gameLoop mouseDown
]

{ #category : 'as yet unclassified' }
PSGWindow >> handleMouseOver: anEvent [
	| global local |
	global := anEvent position.
	local := global - drawLoop position.
	gameLoop mouseOver: local.
]

{ #category : 'as yet unclassified' }
PSGWindow >> handleMouseUp: anEvent [
	gameLoop mouseUp 
]

{ #category : 'initialization' }
PSGWindow >> initialize [

	| morph |
	super initialize.
	self setLabel: 'Sand Game'.
	self extent: 820 @ 640.
	gameLoop := PSGGameLoop new.
	drawLoop := PSGDrawLoop new.
	morph := drawLoop morph.
	morph on: #mouseDown send: #handleMouseDown: to: self.
	morph on: #mouseUp send: #handleMouseUp: to: self.
	morph on: #mouseMove send: #handleMouseOver: to: self.
	morph on: #keyDown send: #handleKeyDown: to: self.
	self addMorph: morph.
	drawLoop draw: gameLoop matrix.
	process := self gameLoopProcess.
	self announcer
		when: WindowClosed
		do: [ :an | self terminate ]
		for: self
]

{ #category : 'accessing' }
PSGWindow >> runGameLoop [
    [true] whileTrue: [
		| frameTime waitTime |
        frameTime := Time millisecondClockValue + 50.
        gameLoop step.
        drawLoop draw: gameLoop matrix.
        waitTime := frameTime - Time millisecondClockValue.
        waitTime > 0 ifTrue: [
            (Delay forMilliseconds: waitTime) wait.
        ].
    ].
	^ self
]

{ #category : 'debugging actions' }
PSGWindow >> terminate [
	process terminate.
]
