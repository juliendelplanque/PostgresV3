toolbuilder
refresh

	| index |
	index := selected ifNotNil: [ changes indexOf: selected ] ifNil: [ 1 ].
	changes := self findChanges.
	self selected: (changes at: index ifAbsent: nil).
	self changed: #changes