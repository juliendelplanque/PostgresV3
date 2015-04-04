as yet unclassified
findChanges

	| matches |
	matches := self findMatches.
	^matches reject: #hasSameSource