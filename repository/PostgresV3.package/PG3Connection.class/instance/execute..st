simple-query-protocol
execute: aString
	"Execute the query given in aString with the simple query protocol"

	^self execute: aString rowClass: nil