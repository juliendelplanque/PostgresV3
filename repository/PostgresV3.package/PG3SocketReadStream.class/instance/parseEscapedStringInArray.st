parsing
parseEscapedStringInArray

	^textConverter convertToSqueak: (String streamContents: [ :stream |
		| byte notEscaped |
		notEscaped := true.
		[ (byte := self next) = 34 and: [ notEscaped ] ] whileFalse: [
			notEscaped
				ifFalse: [
					stream nextPut: (Character value: byte).
					notEscaped := true ]
				ifTrue: [
					byte = 92 "$\ asciiValue"
						ifTrue: [ notEscaped := false ]
						ifFalse: [ 
							stream nextPut: (Character value: byte) ] ] ] ])