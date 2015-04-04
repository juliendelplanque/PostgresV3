private
getConnection
	
	| freeConnection timeout |
	freeConnection := nil.
	timeout := DateAndTime now + arguments waitTimeout milliSeconds.
	monitor critical: [
		self log: [ 'FreeConnections: ', freeConnections size asString, String cr, 'UsedConnections: ', usedConnections size asString ].
		[ DateAndTime now < timeout and: [ freeConnection isNil ] ] whileTrue: [
			freeConnections 
				ifNotEmpty: [ freeConnection := freeConnections removeLast ]
				ifEmpty: [
					monitor
						waitUntil: [
							DateAndTime now >= timeout 
								or: [ freeConnections notEmpty 
								or: [ usedConnections size < arguments maxConnections ] ] ]
						maxMilliseconds: (timeout - DateAndTime now) asMilliSeconds.
					(freeConnections isEmpty and: [
						usedConnections size < arguments maxConnections ]) ifTrue: [
							[ freeConnection := self createNewConnection ]
								on: Error
								do: [ :error | self log: error messageText ] ] ].
			(freeConnection notNil and: [ 
				freeConnection isConnected and: [
					freeConnection isReadyForQuery ] ])
				ifFalse: [ freeConnection := nil ] ].
		freeConnection ifNotNil: [ usedConnections add: freeConnection ] ].
	^freeConnection ifNil: [ 
		self error: 'Couldn''t get a connection in ', arguments waitTimeout asString, ' milliseconds!'.
		freeConnection ]