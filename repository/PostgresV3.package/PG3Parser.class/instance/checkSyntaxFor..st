as yet unclassified
checkSyntaxFor: functionPragma

	| functionMirror schemaMirror response |
	[
		schemaMirror := encoder classEncoding.
		functionMirror := PG3FunctionMirror 
			fromPragma: functionPragma 
			in: schemaMirror.
		functionMirror body: token.
		 schemaMirror executeTransaction: [ :connection |
			[ response := functionMirror saveToDatabase ] ensure: [
				(cue requestor notNil and: [ schemaMirror commitOnAccept ]) ifFalse: [ connection rollback ] ] ] ]
		on: Error
		do: [ :err |
			Transcript show: 'Couldn''t check syntax.'; cr.
			^self ].
	response ifEmpty: [ ^self ].
	(response last class == PG3ErrorResponse) ifTrue: [ 
		| query bodyIndex errorResponse errorPosition |
		errorResponse := response last.
		query := functionMirror printString.
		bodyIndex := (query indexOf: $$) + 2.
		errorResponse position
			ifNil: [ 
				errorPosition := errorResponse internalPosition
					ifNil: [ 0 ]
					ifNotNil: [ :internalPosition | internalPosition asInteger ] ]
			ifNotNil: [
				errorPosition := errorResponse position asInteger - bodyIndex.
				"Compensate for line ending differences"
				bodyIndex to: bodyIndex + errorPosition - 1 do: [ :index |
					(query at: index) = Character cr ifTrue: [
						errorPosition := errorPosition - 1 ] ] ].
		self 
			notify: errorResponse message 
			at: errorPosition + prevEnd + 2 ]
	