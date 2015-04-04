as yet unclassified
statements: argNodes innerBlock: inner blockNode: theBlockNode

	| functionPragma |
	functionPragma := self functionPragma ifNil: [ 
		^super statements: argNodes innerBlock: inner blockNode: theBlockNode ].
	token := source position: prevEnd + 1; upToEnd.
	hereMark := hereEnd := source position + 1.
	hereType := #doIt.
	tokenType := #string.
	self checkSyntaxFor: functionPragma.
	theBlockNode
		arguments: argNodes
		statements: { 
			self nodeForCode: token.
			self messageNodeFor: functionPragma }
		returns: true
		from: encoder.
	parseNode := theBlockNode.
	^true