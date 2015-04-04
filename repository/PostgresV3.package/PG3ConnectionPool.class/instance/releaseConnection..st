private
releaseConnection: aPG3Connection
	
	| invalidConnection |
	aPG3Connection isInTransaction ifTrue: [ 
		aPG3Connection cancelRequest ].
	invalidConnection := false.
	monitor critical: [	
		(usedConnections remove: aPG3Connection ifAbsent: nil)
			ifNil: [ invalidConnection := true ]
			ifNotNil: [
				aPG3Connection isIdle ifTrue: [ 
					freeConnections add: aPG3Connection ].
				self releaseSuperfluousFreeConnections.
				freeConnections ifNotEmpty: [ monitor signal ] ] ].
	invalidConnection ifTrue: [
		aPG3Connection terminate.
		"self error: 'Tried to release a connection from another pool'" ].