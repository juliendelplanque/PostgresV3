simple-query-protocol
execute: aString rowClass: aClass
	"Execute the query given in aString with the simple query protocol"

	| returnedResultSets |
	socketReadStream resetOffset.
	currentRowClass := aClass.
	self sendMessage: (PG3Query new
		queryString: (textConverter convertFromSqueak: aString);
		yourself).
	resultSets := OrderedCollection new: 3.
	state := states at: #Querying.
	self processStates.
	returnedResultSets := resultSets.
	resultSets := nil. "We no longer need them here, and we don't want to hold a reference to them."
	currentRowClass := nil.
	^returnedResultSets