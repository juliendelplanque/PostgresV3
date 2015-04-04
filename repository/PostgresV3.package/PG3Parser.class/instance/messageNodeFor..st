as yet unclassified
messageNodeFor: functionPragma
	
	| refcursorFunction |
	refcursorFunction := functionPragma arguments third = 'refcursor'.
	^(MessageNode new
		receiver: (MessageNode new
			receiver: (encoder encodeVariable: 'self')
			selector: #class
			arguments: #()
			precedence: 1
			from: encoder)
		selector: (
			refcursorFunction
				ifTrue: [ #callRefcursorFunction:signature:withArguments:rowClass: ]
				ifFalse: [ #callNormalFunction:signature:withArguments: ])
		arguments: { 
			encoder encodeLiteral: functionPragma arguments first.
			encoder encodeLiteral: functionPragma arguments second.
			(self withArgumentArrayFor: functionPragma) 
				ifTrue: [ encoder tempNodes first ]
				ifFalse: [ BraceNode new elements: encoder tempNodes ] },
			(refcursorFunction
				ifTrue: [ { 
					(functionPragma arguments at: 5 ifAbsent: [ nil ]) 
						ifNil: [ encoder encodeLiteral: nil ]
						ifNotNil: [ :name | encoder encodeVariable: name ] } ]
				ifFalse: [ #() ])
		precedence: 3
		from: encoder) asReturnNode