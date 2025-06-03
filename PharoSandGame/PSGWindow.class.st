"
This class represents the Pharo sand game window.
The command to spawn the window should be: ""PSGWindow new openInWorld."" nothing else is needed.
"
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

{ #category : 'process' }
PSGWindow >> gameLoopProcess [
	^ [ self runGameLoop ] forkAt: Processor userInterruptPriority named: 'Sand Game Loop'
]

{ #category : 'handling' }
PSGWindow >> handleClick: anEvent [
	| global local |
	global := anEvent position.
	local := global - drawLoop position.
	gameLoop leftClick: local.
]

{ #category : 'handling' }
PSGWindow >> handleKeyDown: anEvent [
	anEvent keyCharacter = Character space ifTrue: [ gameLoop keyEvent: PSGFlipEvent new ].
	anEvent keyCharacter = Character arrowLeft ifTrue: [ gameLoop keyEvent: PSGRotateLeftEvent new ].
	anEvent keyCharacter = Character arrowRight ifTrue: [ gameLoop keyEvent: PSGRotateRightEvent new ].
]

{ #category : 'handling' }
PSGWindow >> handleMouseDown: anEvent [
	gameLoop mouseDown
]

{ #category : 'handling' }
PSGWindow >> handleMouseOver: anEvent [
	| global local |
	global := anEvent position.
	local := global - drawLoop position.
	gameLoop mouseOver: local.
]

{ #category : 'handling' }
PSGWindow >> handleMouseUp: anEvent [
	gameLoop mouseUp 
]

{ #category : 'initialization' }
PSGWindow >> initialize [

	| morph |
	super initialize.
	self setLabel: 'Sand Game'.
	self extent: 620 @ 640.
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

{ #category : 'process' }
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

{ #category : 'process' }
PSGWindow >> terminate [
	process terminate.
]
