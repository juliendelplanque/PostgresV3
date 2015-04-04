as yet unclassified
hasSameSource

	localFunction ifNil: [ ^false ].
	remoteFunction ifNil: [ ^false ].
	^localFunction printString = remoteFunction printString