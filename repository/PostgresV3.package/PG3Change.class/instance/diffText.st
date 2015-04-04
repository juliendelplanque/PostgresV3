as yet unclassified
diffText

	localFunction ifNil: [ ^remoteFunction printString asText ].
	^TextDiffBuilder
		buildDisplayPatchFrom: (remoteFunction ifNil: [ '' ] ifNotNil: [ remoteFunction printString ])
		to: localFunction printString