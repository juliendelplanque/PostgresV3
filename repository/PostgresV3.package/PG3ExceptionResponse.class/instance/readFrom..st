as yet unclassified
readFrom: aStream

	[
		aStream next
			caseOf: {
				[ 0 ] -> [ ^self ].
				[ $S asciiValue ] -> [ severity := aStream nextString ].
				[ $C asciiValue ] -> [ code := aStream nextString ].
				[ $M asciiValue ] -> [ message := aStream nextString ].
				[ $D asciiValue ] -> [ detail := aStream nextString ].
				[ $H asciiValue ] -> [ hint := aStream nextString ].
				[ $P asciiValue ] -> [ position := aStream nextString ].
				[ $p asciiValue ] -> [ internalPosition := aStream nextString ].
				[ $q asciiValue ] -> [ internalQuery := aStream nextString ].
				[ $W asciiValue ] -> [ where := aStream nextString ].
				[ $F asciiValue ] -> [ file := aStream nextString ].
				[ $R asciiValue ] -> [ routine := aStream nextString ] }
			otherwise: [ aStream nextString ] ] repeat