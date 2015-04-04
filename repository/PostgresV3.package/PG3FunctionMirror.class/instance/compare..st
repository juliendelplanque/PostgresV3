as yet unclassified
compare: anotherFunction

	self name < anotherFunction name ifTrue: [ ^1 ].
	self name > anotherFunction name ifTrue: [ ^3 ].
	self arguments size < anotherFunction arguments size ifTrue: [ ^1 ].
	self arguments size > anotherFunction arguments size ifTrue: [ ^3 ].
	2 to: self arguments size by: 2 do: [ :argIndex |
		(self arguments at: argIndex) < (anotherFunction arguments at: argIndex)
			ifTrue: [ ^1].
		(self arguments at: argIndex) > (anotherFunction arguments at: argIndex)
			ifTrue: [ ^3] ].
	^2