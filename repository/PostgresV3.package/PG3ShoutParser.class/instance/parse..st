as yet unclassified
parse: isAMethod 
	"Parse the receiver's text. If isAMethod is true
    then treat text as a method, if false as an
    expression with no message pattern"

	self initializeInstanceVariables.
	sourcePosition := 1.
	arguments := Dictionary new.
	temporaries := Dictionary new.
	blockDepth := bracketDepth := 0.
	ranges
		ifNil: [ranges := OrderedCollection new: 100]
		ifNotNil: [ranges reset].
	errorBlock := [^false].
	[
		self scanNext.
		isAMethod 
			ifTrue: [
				self parseMessagePattern.
				self parsePragmaSequence ] ]
			ensure: [ errorBlock := nil ].
	^true