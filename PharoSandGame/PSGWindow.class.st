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

{ #category : 'initialization' }
PSGWindow >> initialize [
	| morph |
	super initialize.
	self setLabel: 'Sand Game'.
	self extent: 810@640.
	gameLoop := PSGGameLoop new.
	drawLoop := PSGDrawLoop new.
	morph := drawLoop morph.
	morph on: #mouseDown send: #handleClick: to: self.
	self addMorph: morph.
	drawLoop draw: gameLoop matrix.
	process := self gameLoopProcess.
	self on: #windowClosed send: #terminate to: self.
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
